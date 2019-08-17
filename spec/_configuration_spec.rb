# # frozen_string_literal: true

# RSpec.describe WavesClient::Configuration, :skip_default_cfg do
#   before(:all) do
#     WavesClient.configure do |cfg|
#       cfg.node_url = 'https://node.url'
#       cfg.node_api_key = 'XYZ'
#     end
#   end

#   it { expect(WavesClient.configuration.node_url).to eq('https://node.url') }
#   it { expect(WavesClient.configuration.node_api_key).to eq('XYZ') }

#   context 'impact on api_struct configuration' do
#     let(:cfg) { ApiStruct::Settings.config.endpoints[:api] }

#     it { expect(cfg[:root]).to eq(WavesClient.configuration.node_url) }
#     it { expect(cfg[:headers][:'X-API-Key']).to eq(WavesClient.configuration.node_api_key) }
#   end
# end
