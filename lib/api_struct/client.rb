# frozen_string_literal: true

module ApiStruct
  class Client
    DEFAULT_HEADERS = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }.freeze

    URL_OPTION_REGEXP = %r{/:([a-z_]+)}.freeze

    attr_reader :client

    def config
      ::WavesClient::Settings.config
    end

    def api_root
      value = config.node[:url]
      puts "[DEBUG] #{__method__}: #{value}" if config.debug

      value
    end

    def default_params
      value = config.node[:params] || {}
      puts "[DEBUG] #{__method__}: #{value}" if config.debug

      value
    end

    #
    # All inherited classes have to implement this method
    #
    # def default_path
    #   'posts'
    # end

    def headers
      value = DEFAULT_HEADERS.merge(
        'X-API-Key': config.node[:api_key]
      )
      puts "[DEBUG] #{__method__}: #{value}" if config.debug

      value
    end

    HTTP_METHODS = %i[get post patch put delete].freeze

    HTTP_METHODS.each do |http_method|
      define_method http_method do |*args, **options|
        options[:params] = default_params.merge(options[:params] || {})
        url = remove_double_slashes(build_url(args, options)).to_s

        debug_block_http_method(http_method, url, options) if config.debug

        wrap client.send(http_method, url, options)
      rescue HTTP::ConnectionError => e
        failure(body: e.message, status: :not_connected)
      end
    end

    def initialize
      client_headers = headers || DEFAULT_HEADERS
      @client = HTTP::Client.new(headers: client_headers)

      puts('[DEBUG] CLIENT: ', @client.inspect) if config.debug
    end

    private

    def wrap(response)
      response.status < 300 ? success(response) : failure(response)
    end

    def success(response)
      body = response.body.to_s
      result = !body.empty? ? JSON.parse(body, symbolize_names: true) : nil

      puts("[DEBUG] #{__method__}: ", result, response) if config.debug
      Dry::Monads::Success(result)
    end

    def failure(response)
      result = ApiStruct::Errors::Client.new(response)
      puts("[DEBUG] #{__method__}: ", result, response) if config.debug

      Dry::Monads::Failure(result)
    end

    def first_arg(args)
      args.first.to_s
    end

    def debug_block_http_method(http_method, url, options)
      puts "\n [DEBUG] #{http_method} ------------------------------- "
      puts "\t URL: #{url}"
      puts "\t Options: #{options.inspect}"
      puts " ------------------------------------------------------ \n"
    end

    def remove_double_slashes(address)
      url = URI.parse(address)
      url.path.gsub! %r{/+}, '/'
      url.to_s
    end

    def build_url(args, options)
      suffix = to_path(args)
      prefix = to_path(options.delete(:prefix))
      path = to_path(options.delete(:path) || default_path)
      replace_optional_params(to_path(api_root, prefix, path, suffix), options)
    end

    def to_path(*args)
      Array(args).reject { |o| o.respond_to?(:empty?) ? o.empty? : !o }
                 .join('/')
    end

    def replace_optional_params(url, options)
      url.gsub(URL_OPTION_REGEXP) do
        value = options.delete(Regexp.last_match(1).to_sym)
        value ? "/#{value}" : ''
      end
    end
  end
end
