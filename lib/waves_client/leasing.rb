# frozen_string_literal: true

module WavesClient
  class Leasing < ApiStruct::Client
    api :leasing

    # Get all active leases for an address
    #
    # GET /leasing/active/{address}
    # https://testnodes.wavesnodes.com/api-docs/index.html#!/leasing/active_1
    def active(address)
      get(path: 'leasing/active/:address', address: address)
    end
  end
end
