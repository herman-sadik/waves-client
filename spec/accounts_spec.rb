# frozen_string_literal: true

RSpec.describe WavesClient::Crypto do
  describe 'TESTNET' do
    let(:t1_account) { build(:first_testnet_account) }
    let(:t2_account) { build(:secound_testnet_account) }

    context 'from seed string generates' do
      it 'valid private key 1' do
        key = described_class.private_key(t1_account.backup_phrase)
        expect(t1_account.private_key).to eq(key)
      end

      it 'valid private key 2' do
        key = described_class.private_key(t2_account.backup_phrase)
        expect(t2_account.private_key).to eq(key)
      end

      it 'valid public key 1' do
        key = described_class.public_key(t1_account.backup_phrase)
        expect(t1_account.public_key).to eq(key)
      end

      it 'valid public key 2' do
        key = described_class.public_key(t2_account.backup_phrase)
        expect(t2_account.public_key).to eq(key)
      end

      it 'valid key pair 1' do
        key_pair = described_class.key_pair(t1_account.backup_phrase)
        expect(key_pair).to have_value(t1_account.private_key)
        expect(key_pair).to have_value(t1_account.public_key)
      end

      it 'valid address 1' do
        addr = described_class.address(t1_account.backup_phrase)
        expect(addr).to eq(t1_account.address)
      end

      it 'valid address 2' do
        addr = described_class.address(t2_account.backup_phrase)
        expect(addr).to eq(t2_account.address)
      end

      it 'invalid address 2' do
        addr = described_class.address(t2_account.backup_phrase, 'W')
        expect(addr).to_not eq(t2_account.address)
      end
    end
  end

  describe 'MAINNET' do
    let(:m1_account) { build(:first_mainnet_account) }

    context 'from seed string generates' do
      it 'valid private key' do
        key = described_class.private_key(m1_account.backup_phrase)
        expect(m1_account.private_key).to eq(key)
      end

      it 'valid private key' do
        key = described_class.private_key(m1_account.backup_phrase)
        expect(m1_account.private_key).to eq(key)
      end

      it 'valid address' do
        addr = described_class.address(m1_account.backup_phrase, 'W')
        expect(addr).to eq(m1_account.address)
      end

      it 'invalid address' do
        addr = described_class.address(m1_account.backup_phrase, 'T')
        expect(addr).to_not eq(m1_account.address)
      end
    end
  end

  # @TODO https://github.com/dougal/base58
  it 'convert from string to base58'
  # bin = described_class.binary_bytes 'ABC123xyz'
  # res = 'qBLg3Cer97Bo'
  # expect(res).to eq(described_class.to_base_58(bin))
  # end

  it 'convert from base58 to string'
  # base58 = 'qBLg3Cer97Bo'
  # res    = 'ABC123xyz'
  # expect(res).to eq(described_class.base_58_to_str(base58).unpack('C*'))
  # end
end
