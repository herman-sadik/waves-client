# frozen_string_literal: true

require 'oj'
require 'waves_client/tx/tx_ids'
require 'waves_client/tx/defaults'

module WavesClient
  module Tx
    class Base
      include ActiveModel::Model
      include ActiveModel::Serializers::JSON
      extend  ActiveModel::Serializers
      include ActiveModel::Validations::Callbacks

      include WavesClient::Tx::TxIds
      include WavesClient::Tx::Defaults

      attr_accessor :type, :fee, :timestamp, :seed, :sender, :feeAssetId, :minSponsoredAssetFee

      # def initialize(seed)
      #   @seed = seed
      # end

      validates :type,
                presence: true,
                numericality: { only_integer: true },
                inclusion: { in: 1..16 } # @TODO exlude 2
      validates :fee,
                presence: true,
                numericality: { only_integer: true }
      validates :timestamp,
                presence: true
      # validates :seed,
      #           presence: true # @TODO check if include worlds

      def attributes
        instance_values.except('errors', 'validation_context', 'seed')
      end

      def payload
        Oj.dump self, indent: 2, mode: :rails
      end
    end
  end
end
