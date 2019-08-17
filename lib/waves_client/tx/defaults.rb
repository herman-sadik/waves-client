# frozen_string_literal: true

require 'active_support/concern'

module WavesClient
  module Tx
    module Defaults
      extend ActiveSupport::Concern

      DEFAULT_TX_FEE = 100_000
      DEFAULT_BASE_FEE = DEFAULT_TX_FEE
      DEFAULT_SMART_FEE = 400_000
      DEFAULT_ASSET_FEE = 100_000_000
      DEFAULT_MATCHER_FEE = 300_000
      DEFAULT_LEASE_FEE = 100_000
      DEFAULT_ALIAS_FEE = 100_000
      DEFAULT_SPONSOR_FEE = 100_000_000
      DEFAULT_SCRIPT_FEE = 100_000
      DEFAULT_ASSET_SCRIPT_FEE = 100_000_000
      DEFAULT_SET_SCRIPT_FEE = 1_000_000
      DEFAULT_INVOKE_SCRIPT_FEE = 500_000

      included do
        before_validation :timestamp_default
      end

      def timestamp_default
        self.timestamp = (Time.now.to_f * 1000).to_i # timestamp in milliseconds
      end

    end
  end
end
