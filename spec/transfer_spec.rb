# frozen_string_literal: true

RSpec.describe WavesClient::Tx::Transfer do
  context 'VALID' do
    let(:transfer) { build(:success_transfer) }

    it 'is valid' do
      expect(transfer.valid?).to eq(true)
    end

    it 'has default timestamp' do
      transfer.timestamp = nil
      transfer.valid?
      expect(transfer.timestamp).to_not eq(nil)
    end
  end
end
