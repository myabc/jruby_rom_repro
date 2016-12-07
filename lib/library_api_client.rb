require 'rom'

require 'dry-types'
require 'library_api_client/models'

##
# Namespace used to hold utilities to access Library API
#
module LibraryApiClient
  module Types
    include Dry::Types.module
  end

  ##
  # hold LibraryApiClient configuration options
  #
  class Config
    class << self
      attr_accessor :api_url, :token, :rom_container

      ##
      # Check if config object is valid
      #
      # @return [Boolean] true if the config object is valid
      def valid?
        true
      end
    end
  end

  class << self
    extend Forwardable
    ##
    # Configure LibraryApiClient
    #
    # @example
    #   LibraryApiClient.setup do |config|
    #     config.api_url = 'https://example.com'
    #     config.token = 'SOME TOKEN'
    #   end
    #
    # @yieldparam [LibraryApiClient::Config] The config object
    def setup
      yield LibraryApiClient::Config

      configuration = ROM::Configuration.new(
        :http,
        uri: LibraryApiClient::Config.api_url,
        headers: {
          Accept: 'application/json',
          Authorization: LibraryApiClient::Config.token
        }
      )
      configuration.auto_registration(File.join(__dir__, 'library_api_client'),
                                      namespace: 'LibraryApiClient')
      LibraryApiClient::Config.rom_container = ROM.container(configuration)

      configured?
    end

    ##
    # returns ROM container
    #
    # @api private
    def container
      raise 'please configure library_api_client see README' unless configured?
      LibraryApiClient::Config.rom_container
    end

    def_delegator 'LibraryApiClient::Config', :valid?, :configured?
  end
end
