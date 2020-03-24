# frozen_String_literal: true

# ApiStruct::Settings.configure do |config|
#   config.endpoints = {
#     api: {
#       root: ENV.fetch('NODE_URL') { 'https://testnodes.wavesnodes.com' },
#       headers: {
#         'content-type': 'application/json',
#         'X-API-Key': ENV.fetch('NODE_API_KEY') { '' }
#       }
#     }
#   }
# end

WavesClient::Settings.config.node.url = 'http://localhost:6869'
WavesClient::Settings.config.node.api_key = 'waves-private-node'
WavesClient::Settings.config.node.params = {}
