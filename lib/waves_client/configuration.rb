# frozen_string_literal: true

module WavesClient
  class Configuration
    extend Dry::Configurable

    setting :node do
      setting :url, 'https://testnodes.wavesnodes.com'
      setting :api_key, ''
    end
  end
end
