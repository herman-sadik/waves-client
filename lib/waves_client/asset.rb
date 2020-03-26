# frozen_string_literal: true

module WavesClient
  class Asset < ApiStruct::Client

    def default_path
      'assets'
    end

    # Provides detailed information about given asset
    #
    # GET
    # https://testnodes.wavesnodes.com/api-docs/index.html#!/assets/details_1
    def details(asset_id)
      get(path: 'assets/details/:asset_id', asset_id: asset_id)
    end

    # Account's balances for all assets
    #
    # GET /assets/balance/{address}
    # https://testnodes.wavesnodes.com/api-docs/index.html#!/assets/balances_1
    def account_balance(address)
      get(path: 'assets/balance/:address', address: address)
    end

    # Account's balance by given asset
    #
    # GET /assets/balance/{address}/{assetId}
    # https://testnodes.wavesnodes.com/api-docs/index.html#!/assets/balance
    def balance(address, asset_id)
      get(path: 'assets/balance/:address/:asset_id', address: address, asset_id: asset_id)
    end

    
  end
end
