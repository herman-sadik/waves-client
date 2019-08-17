# frozen_string_literal: true

module WavesClient
  module Tx
    module TxIds
      # Transaction types
      # https://docs.wavesplatform.com/en/blockchain/transaction-type.html
      TX_GENESIS_ID          = 1
      TX_ISSUE_ID            = 3
      TX_TRANSFER_ID         = 4
      TX_REISSUE_ID          = 5
      TX_BURN_ID             = 6
      TX_EXCHANGE_ID         = 7
      TX_LEASE_ID            = 8
      TX_LEASE_CANCEL_ID     = 9
      TX_ALIAS_ID            = 10
      TX_MASS_ID             = 11
      TX_DATA_ID             = 12
      TX_SET_SCRIPT_ID       = 13
      TX_SPONSORSHIP_ID      = 14
      TX_SET_ASSET_SCRIPT_ID = 15
      TX_INVOKE_SCRIPT_ID    = 16
    end
  end
end
