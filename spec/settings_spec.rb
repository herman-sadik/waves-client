# frozen_string_literal: true

RSpec.describe WavesClient::Settings do
  subject(:config) { described_class.config }

  it { described_class.ancestors.include?(Dry::Configurable) }

  describe 'default' do
    it { expect(config.node.url).to eq('http://localhost:6869') }
    it { expect(config.node.api_key).to eq('waves-private-node') }
    it { expect(config.debug).to be_truthy }
  end

  describe 'overwritten' do
    before do
      described_class.config.node.url = 'https://testnodes.wavesnodes.com'
      described_class.config.node.api_key = ''
      described_class.config.debug = false
    end

    it { expect(config.node.url).to eq('https://testnodes.wavesnodes.com') }
    it { expect(config.node.api_key).to be_blank }

    it { expect(config.debug).to be_falsey }
  end
end
