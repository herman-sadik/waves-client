# frozen_string_literal: true

RSpec.describe WavesClient::Address do
  let(:address) { build(:address) }

  describe '#index response' do
    let(:request) { subject.index }

    it { expect(request).to be_success }
    it { expect(request.value!).to be_kind_of(Array) }

    it { expect(request.value!).to include(address.valid) }
    it { expect(request.value!).to_not include(address.invalid) }
  end

  describe '#balance response' do
    let(:valid_request) { subject.balance(address.valid) }
    let(:invalid_request) { subject.balance(address.invalid) }

    it { expect(valid_request).to be_success }
    it { expect(valid_request.value!.key?(:balance)).to eq(true) }

    it 'has more then 0 on valid address' do
      val = valid_request.value!
      expect(val[:balance]).to be > 0, "Check balance on: \
        https://wavesexplorer.com/testnet/address/#{address.valid}"
    end

    it 'has 0 on invalid address' do
      val = invalid_request.value!
      expect(val[:balance]).to be_zero, "Check balance on: \
        https://wavesexplorer.com/testnet/address/#{address.invalid}"
    end
  end

  describe '#balance_details response' do
    let(:valid_request) { subject.balance_details(address.valid) }
    let(:invalid_request) { subject.balance_details(address.invalid) }

    it { expect(valid_request).to be_success }
    it { expect(valid_request.value!.key?(:regular)).to eq(true) }

    it 'has more then 0 available on valid address' do
      val = valid_request.value!
      expect(val[:available]).to be > 0, "Check balance on: \
        https://wavesexplorer.com/testnet/address/#{address.valid}"
    end
  end

  describe '#data response' do
    context 'on address with data' do
      let(:response) { subject.data(address.valid) }
      it { expect(response).to be_success }
      it { expect(response.value!).to be_kind_of(Array) }
      it { expect(response.value!.first).to be_kind_of(Hash) }
      it { expect(response.value!.first.key?(:key)).to be(true) }
    end

    context 'on address without data' do
      let(:response) { subject.data(address.invalid) }

      it { expect(response).to be_success }
      it { expect(response.value!).to be_kind_of(Array) }
      it { expect(response.value!).to be_empty }
    end

    it 'has matched data' do
      key = 'name'
      response = subject.data(address.valid, matches: key)

      expect(response.value!.first[:key]).to eq(key)
    end

    it 'has not matched data' do
      key = 'kiełbasa_nietłusta'
      response = subject.data(address.valid, matches: key)

      expect(response.value!).to be_empty
    end
  end

  it '#create'
end
