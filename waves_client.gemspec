# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'waves_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'waves_client'
  spec.version       = WavesClient::VERSION
  spec.authors       = ['Herman Sadik']
  spec.email         = ['herman.sadik@gmail.com']

  spec.summary       = 'An API wrapper for Waves platform'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/herman-sadik/waves-client'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  #   spec.metadata["homepage_uri"] = spec.homepage
  #   spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #   spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.post_install_message = 'For waves_client gem to work properly, you must first install the libsodium package!'

  spec.add_development_dependency 'bundler', '~> 2.0.2'
  spec.add_development_dependency 'byebug', '~> 11.0.1'
  spec.add_development_dependency 'dotenv', '~> 2.7.5'
  spec.add_development_dependency 'factory_bot_rails', '~> 5.0.2'
  spec.add_development_dependency 'rake', '~> 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rubocop', '~> 0.74.0'

  spec.add_dependency 'activemodel'
  spec.add_dependency 'api_struct', '~> 1.0.5'
  spec.add_dependency 'base58', '~> 0.2.3'
  spec.add_dependency 'blake2b', '~> 0.10.0'
  spec.add_dependency 'digest-sha3', '~> 1.1.0'
  spec.add_dependency 'dry-configurable', '~> 0.8.3'
  spec.add_dependency 'oj', '~> 3.8.1'

  #
  # @TODO - `brew install libsodium`
  #
  spec.add_dependency 'rbnacl', '~> 7.0.0'
end
