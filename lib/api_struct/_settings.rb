module ApiStruct
  class Settings
    extend ::Dry::Configurable
    setting :endpoints, {}

    setting :node do
      setting :url, 'https://testnodes.wavesnodes.com'
      setting :api_key, ''
      setting :params, {}
    end
  end
end
