# frozen_string_literal: true

module WavesClient
  module Tx
    class Transfer < WavesClient::Tx::Base
      attr_accessor :recipient
      attr_accessor :asset_id # ID of a token, or WAVES
      attr_accessor :amount # The real amount is the given number divided by 10^(precision of the token)
      attr_accessor :attachment # 140 bytes of data (it's allowed to use Uint8Array here)
      attr_accessor :fee_asset_id # The real amount is the given number divided by 10^(precision of the token)

      before_validation :default_fee

      # @TODO - create waves address validator
      validates :recipient, presence: true
      validates :amount, presence: true, numericality: { only_integer: true }

      def initialize
        @type = TX_TRANSFER_ID
        super
      end

      def default_fee
        self.fee = DEFAULT_TX_FEE
      end
    end
  end
end
