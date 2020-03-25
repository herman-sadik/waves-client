# frozen_string_literal: true

module WavesClient
  class Settings
    extend Dry::Configurable

    setting :node do
      setting :url, 'http://localhost:6869'
      setting :api_key, 'waves-private-node'
      setting :params, {}
    end

    setting :debug, false
  end
end
