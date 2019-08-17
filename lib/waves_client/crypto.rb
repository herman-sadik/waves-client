# frozen_string_literal: true

require 'base58'
require 'blake2b'
require 'digest/sha3'
require 'openssl'
require 'rbnacl'

module WavesClient
  #
  # Methods needed to get public key, private key or address
  # from seed (string of words)
  # Read more: https://github.com/wavesplatform/waves-documentation/blob/master/ko/technical-details/cryptographic-practical-details.md
  #
  class Crypto
    class << self
      # nonce ?
      def public_key(seed_string, nonce = 0)
        account_seed_sha256 = account_seed_sha256(seed_string, nonce)
        raw_key = raw_public_key_from_seed(account_seed_sha256)

        to_base_58(raw_key)
      end

      def private_key(seed_string, nonce = 0)
        account_seed_sha256 = account_seed_sha256(seed_string, nonce)

        bseed = account_seed_sha256.bytes
        bseed[0] &= 248
        bseed[31] &= 127
        bseed[31] |= 64

        to_base_58(bseed.pack('C*'))
      end

      def key_pair(seed_string, nonce = 0)
        {
          private: private_key(seed_string, nonce),
          public:  public_key(seed_string, nonce)
        }
      end

      #
      # @param net - 'W' - main, 'T' - test
      # @param nonce ?!
      def address(seed_string, network = 'T', nonce = 0)
        account_seed_sha256 = account_seed_sha256(seed_string, nonce)
        pubkey_raw          = raw_public_key_from_seed(account_seed_sha256)

        # no nonce ! pubkey NOT encoded with base58
        s1_blake  = blake2b256_no_nonce(pubkey_raw)
        hash      = keccak256(s1_blake)
        stream    = [1] + [network.ord] + hash.unpack('C*')[0..19]
        s2_blake  = blake2b256_no_nonce(stream.pack('C*'))
        checksum  = keccak256(s2_blake)
        stream   += checksum.bytes[0..3]

        to_base_58(stream.pack('C*'))
      end

      # def address_from_pub_key(pub_key, network = 'T')
      # end


      #
      # Convert strings such as seed words to base58
      #
      def to_base_58(str)
        Base58.binary_to_base58(str, :bitcoin, true)
      end

 
      #
      # Convert strings such as seed words to base58
      #
      def base_58_to_str(binary_str)
        Base58.base58_to_binary(binary_str)
      end


      ##########################################################################
      #
      # HELPER METHODS
      #
      def account_seed_sha256(seed_string, nonce = 0)
        digest = Digest::SHA256.new
        digest.digest(account_seed(seed_string, nonce))
      end

      def account_seed(seed_string, nonce = 0)
        keccak256(blake2b256(seed_string, nonce))
      end

      def blake2b256(seed, nonce = 0)
        Blake2b.bytes(binary_bytes(seed, nonce)).pack('c*')
      end

      def blake2b256_no_nonce(seed)
        Blake2b.bytes(binary_bytes(seed)).pack('c*')
      end

      def keccak256(bytes)
        Digest::SHA3.digest(bytes, 256)
      end

      def raw_public_key_from_seed(account_seed)
        key = RbNaCl::PrivateKey.new(account_seed)
        key.public_key.to_s
      end

      def binary_bytes(seed, nonce = nil)
        binary_string = [seed].pack('A*')
        return binary_string if nonce.nil?

        binary_nonce = [nonce].pack 'I'
        binary_nonce.concat(binary_string)
      end

      def base58_blake2b256(seed, nonce = 0)
        to_base_58(blake2b256(seed, nonce))
      end

      def base58_account_seed(seed_string, nonce = 0)
        to_base_58(account_seed(seed_string, nonce))
      end

      def base58_account_seed_sha256(seed_string, nonce = 0)
        to_base_58(account_seed_sha256(seed_string, nonce))
      end
    end
  end
end
