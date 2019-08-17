# frozen_string_literal: true
require 'byebug'

RSpec.describe WavesClient::Transaction do
  describe 'VALID' do
    let(:transfer) { build(:success_transfer) }

    it 'Success transfer' do
      transaction = described_class.new

      expect(transfer.valid?).to eq(true)

      if transfer.valid?
        signed_payload = transaction
                         .signed_data(transfer.payload)
        result         = transaction
                         .broadcast(signed_payload.to_s)

        puts result.inspect
        expect(result.success?).to eq(true)
      end
    end
  end

  describe 'INVALID' do
    let(:transfer) { build(:fail_transfer) }

    it 'Faild transfer' do
      transaction = described_class.new

      expect(transfer.valid?).to eq(true)

      if transfer.valid?
        signed_payload = transaction
                         .signed_data(transfer.payload)
        result         = transaction
                         .broadcast(signed_payload.to_s)

        puts result.inspect
        expect(result.success?).to eq(false)
      end
    end
  end
end
