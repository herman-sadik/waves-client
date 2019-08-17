# frozen_String_literal: true

module WavesClient
  class Configuration
    attr_accessor :node_url, :node_api_key

    def initialize
      @node_url     = nil
      @node_api_key = nil
    end

    def configure_api_struct!
      ApiStruct::Settings.configure do |c|
        c.endpoints = { api: api_struct_hash(node_url, node_api_key) }
      end
    end

    def api_struct_hash(root, key)
      {
        root: root,
        headers: {
          'content-type': 'application/json',
          'X-API-Key': key
        }
      }
    end
  end
end
