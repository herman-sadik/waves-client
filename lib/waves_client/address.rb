# frozen_string_literal: true

module WavesClient
  class Address < ApiStruct::Client
    api :addresses

    # Get wallet accounts addresses
    #
    # GET /addresses
    # https://testnodes.wavesnodes.com/api-docs/index.html#!/addresses/root_1 
    def index
      get
    end

    # Read all data posted by an account
    #
    # GET /addresses/data/{address}
    # https://testnodes.wavesnodes.com/api-docs/index.html#!/addresses/getData_1
    def data(address, **opts)
      get(path: 'addresses/data/:address', address: address, params: opts)
    end

    # Account's WAVES balance
    #
    # GET /addresses/balance/{address}
    # https://testnodes.wavesnodes.com/api-docs/index.html#!/addresses/balance_2
    def balance(address)
      get(path: 'addresses/balance/:address', address: address)
    end

    # Account's WAVES balance details
    #
    # GET /addresses/balance/details/{address}
    # https://testnodes.wavesnodes.com/api-docs/index.html#!/addresses/balanceDetails_1
    def balance_details(address)
      get(path: 'addresses/balance/details/:address', address: address)
    end

    # Check whether address {address} is valid or not
    #
    # GET /addresses/validate/{address}
    # https://testnodes.wavesnodes.com/api-docs/index.html#!/addresses/validate_2
    def validate(address)
      get(path: 'addresses/validate/:address', address: address)
    end

    # @TODO Export seed value for the {address}
    #
    # GET /addresses/seed/{address}
    # https://testnodes.wavesnodes.com/api-docs/index.html#!/addresses/seed_2
    def seed(address)
      get(path: 'addresses/seed/:address', address: address)
    end

    # Create a new account in the wallet(if it exists)
    #
    # POST /addresses
    # https://testnodes.wavesnodes.com/api-docs/index.html#!/addresses/create
    def create
      post
    end

    # Remove the account with address {address} from the wallet
    #
    # DELETE /addresses/{address}
    # http://54.38.54.135:6869/api-docs/index.html#!/addresses/deleteAddress_1
    def destroy(address)
      delete(path: 'addresses/:address', address: address)
    end
  end
end
