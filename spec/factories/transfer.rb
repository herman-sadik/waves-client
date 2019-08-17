# frozen_string_literal: true

FactoryBot.define do
  factory :success_transfer, class: WavesClient::Tx::Transfer do
    # generated on node, so private key and seeds no needed
    # https://wavesexplorer.com/testnet/tx/BZokXeqmWs1HUz2zVz82RP2dUdUQ6hpnf45n61kXu1Vt
    sender { '3N3rcsoZwZBRikVPhCoZTXt7Xng3MPK6htA' }
    recipient { '3My6WVVi1hKfGUqgam4S6nsNYatdeiS6KGT' }
    amount { 10 }
  end

  factory :fail_transfer, class: WavesClient::Tx::Transfer do
    # generated on node, so private key and seeds no needed
    # negative waves balance
    sender { '3MownBhahTmzqKuAoze2MMiACLJa3NpKzQq' }
    recipient { '3My6WVVi1hKfGUqgam4S6nsNYatdeiS6KGT' }
    amount { 10 }
  end
end
