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
end
