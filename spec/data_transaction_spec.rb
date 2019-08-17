# frozen_string_literal: true

RSpec.describe WavesClient::Transaction do
  describe 'VALID' do
    let(:data) { build(:valid_data) }

    it 'Success data transaction' do
      expect(data.valid?).to eq(true), "Expected valid data object \
        <WavesClient::Tx::Data>, error: #{data.errors.messages.inspect}"

      if data.valid?
        payload = data.payload.as_json

        signed_payload = subject
                         .signed_data(payload)
        result         = subject
                         .broadcast(signed_payload.to_s)

        puts result.inspect
        expect(result.success?).to eq(true)
      end
    end
  end
end
