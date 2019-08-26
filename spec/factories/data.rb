# frozen_string_literal: true

FactoryBot.define do
  factory :valid_data, class: WavesClient::Tx::Data do
    sender { '3N3rcsoZwZBRikVPhCoZTXt7Xng3MPK6htA' }
    data { [{ key: 'name', type: 'string', value: 'KIA' }, { key: 'model', type: 'string', value: 'proceed GT' }] }
  end

  factory :invalid_data, class: WavesClient::Tx::Data do
    sender { '3N3rcsoZwZBRikVPhCoZTXt7Xng3MPK6htA' }
    data { 'Not array' }
  end

  factory :sponsorship_data, class: WavesClient::Tx::Data do
    sender { '3NBhUJ73f4MkJQ79NXs1m4RQoVxHTxQXvys' }
    data { [{ key: 'sponsor', type: 'string', value: 'ParkCashTest' }] }
    feeAssetId { 'ApQAN5q49ZgrS34jcV9kMUvZrk8JexeQCyMKawJzQNCz' }
    minSponsoredAssetFee { 1 }
    fee { 1 }
  end
end
