# frozen_string_literal: true

module ApiStruct
  class Client
    DEFAULT_HEADERS = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }.freeze
    URL_OPTION_REGEXP = %r{/:([a-z_]+)}.freeze

    attr_reader :client

    def api_root
      # WavesClient::Configuration.config.node.url
      Settings.config.node[:url]
    end

    def default_params
      Settings.config.node[:params] || {}
    end

    #
    # All inherited classes have to implement this method
    #
    def default_path
      'posts'
    end

    def headers
      Settings.config.node[:headers]
    end

    HTTP_METHODS = %i[get post patch put delete].freeze

    HTTP_METHODS.each do |http_method|
      define_method http_method do |*args, **options|
        options[:params] = default_params.merge(options[:params] || {})
        wrap client.send(http_method, build_url(args, options), options)
      rescue HTTP::ConnectionError => e
        failure(body: e.message, status: :not_connected)
      end
    end

    def initialize
      client_headers = headers || DEFAULT_HEADERS
      @client = HTTP::Client.new(headers: client_headers)
    end

    private

    def wrap(response)
      response.status < 300 ? success(response) : failure(response)
    end

    def success(response)
      body = response.body.to_s
      result = !body.empty? ? JSON.parse(body, symbolize_names: true) : nil
      Dry::Monads::Success(result)
    end

    def failure(response)
      result = ApiStruct::Errors::Client.new(response)
      Dry::Monads::Failure(result)
    end

    def first_arg(args)
      args.first.to_s
    end

    def build_url(args, options)
      suffix = to_path(args)
      prefix = to_path(options.delete(:prefix))
      path = to_path(options.delete(:path) || default_path)

      replace_optional_params(to_path(api_root, prefix, path, suffix), options)
    end

    def to_path(*args)
      Array(args).reject { |o| o.respond_to?(:empty?) ? o.empty? : !o }.join('/')
    end

    def replace_optional_params(url, options)
      url.gsub(URL_OPTION_REGEXP) do
        value = options.delete(Regexp.last_match(1).to_sym)
        value ? "/#{value}" : ''
      end
    end
  end
end
