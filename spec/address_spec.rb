# frozen_string_literal: true

require 'byebug'

RSpec.describe WavesClient::Address do
  let!(:address_1) { subject.create.value![:address] }
  let(:address_2) { subject.create.value![:address] }

  describe '#create response' do
    let(:request) { subject.create }
    let(:next_request) { subject.create }

    it { expect(request).to be_success }
    it { expect(request.value!).to be_kind_of(Hash) }
    it { expect(request.value![:address]).to be_kind_of(String) }
    it { expect(request.value![:address]).to_not eq(next_request.value![:address])}
  end

  describe '#index response' do
    # let!(:address_1) { subject.create.value![:address] }
    let(:request) { subject.index }

    it { expect(request).to be_success }
    it { expect(request.value!).to be_kind_of(Array) }

    it { expect(request.value!).to include(address_1) }
    it { expect(request.value!).to_not include(address_2) }
  end

  describe '#balance response' do
    let(:valid_request) { subject.balance(address_1) }
    # let(:invalid_request) { subject.balance(address.invalid) }

    it { expect(valid_request).to be_success }
    it { expect(valid_request.value!.key?(:balance)).to eq(true) }

    # it 'has more then 0 on valid address' do
    #   val = valid_request.value!
    #   expect(val[:balance]).to be > 0, "Check balance on: \
    #     https://wavesexplorer.com/testnet/address/#{address.valid}"
    # end

    # it 'has 0 on invalid address' do
    #   val = invalid_request.value!
    #   expect(val[:balance]).to be_zero, "Check balance on: \
    #     https://wavesexplorer.com/testnet/address/#{address.invalid}"
    # end

    it 'has 0 on valid address' do
      val = valid_request.value!
      expect(val[:balance]).to be_zero, "Check balance on: \
        https://wavesexplorer.com/testnet/address/#{address_1}"
    end
  end

  describe '#balance_details response' do
    let(:valid_request) { subject.balance_details(address_1) }
    # let(:invalid_request) { subject.balance_details(address.invalid) }

    it { expect(valid_request).to be_success }
    it { expect(valid_request.value!.key?(:regular)).to eq(true) }

    it 'has 0 available on valid address' do
      val = valid_request.value!
      expect(val[:available]).to be_zero, "Check balance on: \
        https://wavesexplorer.com/testnet/address/#{address_1}"
    end
  end

  # describe '#data response' do
  #   context 'on address with data' do
  #     let(:response) { subject.data(address_1) }

  #     it { expect(response).to be_success }
  #     it { expect(response.value!).to be_kind_of(Array) }
  #     it { expect(response.value!.first).to be_kind_of(Hash) }
  #     it { expect(response.value!.first.key?(:key)).to be(true) }
  #   end

  #   context 'on address without data' do
  #     let(:response) { subject.data(address.invalid) }

  #     it { expect(response).to be_success }
  #     it { expect(response.value!).to be_kind_of(Array) }
  #     it { expect(response.value!).to be_empty }
  #   end

  #   it 'has matched data' do
  #     key = 'name'
  #     response = subject.data(address.valid, matches: key)

  #     expect(response.value!.first[:key]).to eq(key)
  #   end

  #   it 'has not matched data' do
  #     key = 'kiełbasa_nietłusta'
  #     response = subject.data(address.valid, matches: key)

  #     expect(response.value!).to be_empty
  #   end
  # end


  describe '#delete response' do

  end
end
