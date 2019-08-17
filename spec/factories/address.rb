# frozen_string_literal: true

FactoryBot.define do
  factory :address, class: OpenStruct do
    valid { '3N3rcsoZwZBRikVPhCoZTXt7Xng3MPK6htA' }
    invalid { '3MxDipFYG55arqkopW4YhgDGJzxUD1ciW93' }
  end
end
