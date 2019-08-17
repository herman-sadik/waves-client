# frozen_string_literal: true

module WavesClient
  module Tx
    class Data < WavesClient::Tx::Base
      attr_accessor :data
      attr_accessor :sender

      before_validation :default_fee

      validates :data, presence: true
      validates :sender, presence: true
      validate  :data_array_of_hashes

      def initialize
        @type = TX_DATA_ID
        super
      end

      private

      def default_fee
        self.fee = DEFAULT_TX_FEE
      end

      def data_array_of_hashes
        errors.add(:data) if !data.is_a?(Array) || !data.first.is_a?(Hash)
      end
    end
  end
end
