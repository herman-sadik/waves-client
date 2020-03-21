# frozen_String_literal: true

require 'api_struct'
require 'active_model'
require 'base58'

require 'waves_client/configuration'
require 'waves_client/api_struct_settings'
require 'waves_client/version'
require 'waves_client/crypto'

require 'waves_client/address'
require 'waves_client/transaction'
require 'waves_client/asset'
require 'waves_client/leasing'
require 'waves_client/debug'
require 'waves_client/wallet'

require 'waves_client/tx/base'
require 'waves_client/tx/transfer'
require 'waves_client/tx/data'

module WavesClient
  class Error < StandardError; end

  # class << self
  #   attr_accessor :configuration
  # end

  # def self.configure
  #   self.configuration ||= Configuration.new
  #   yield(configuration)
  #   self.configuration.configure_api_struct!
  # end
end
