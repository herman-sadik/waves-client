# frozen_String_literal: true

require 'http'
require 'dry/monads/result'
require 'dry-configurable'
require 'dry/inflector'
require 'json'
require 'hashie'
require 'active_model'
require 'base58'

require 'api_struct/concerns/underscore'
require 'api_struct/extensions/api_client'
require 'api_struct/extensions/dry_monads'
require 'api_struct/errors/client'
require 'api_struct/client'

require 'waves_client/settings'
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
end
