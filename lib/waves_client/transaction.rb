# frozen_string_literal: true

module WavesClient
  class Transaction < ApiStruct::Client
    api :transactions

    # Sign a transaction with the sender's private key
    #
    # POST /transactions/sign
    # http://54.38.54.135:6869/api-docs/index.html#!/transactions/sign_3
    def sign(data)
      post(path: 'transactions/sign', body: data)
    end

    def signed_data(data)
      result = sign(data).value!

      Oj.dump result, mode: :rails
    end

    # Broadcast a signed transaction
    # POST /transactions/broadcast
    # http://54.38.54.135:6869/api-docs/index.html#!/transactions/broadcast
    def broadcast(signed_data)
      post(path: 'transactions/broadcast', body: signed_data)
    end
  end
end
