# frozen_string_literal: true

RSpec.describe WavesClient::Tx::Data do
  context 'VALID' do
    let(:data) { build(:valid_data) }

    it 'is valid' do
      expect(data.valid?).to eq(true)
    end
  end

  context 'INVALID' do
    let(:data) { build(:invalid_data) }

    it 'data as string' do
      expect(data.valid?).to eq(false)
    end

    it 'data as array of strings' do
      data.data = %w[a b c]
      expect(data.valid?).to eq(false)
    end
  end
end
