require 'httparty'
require 'nokogiri'
require 'active_support/core_ext/hash'
require 'dhl_elp/helpers'

module DhlElp
  module Request
    module Base
      include Helpers
      include HTTParty
      format :xml

      attr_accessor :debug

      TEST_URL = ""

      PRODUCTION_URL = ""

      def initialize(credentials, options = {})
        requires!(options, )
        @credentials = credentials


      end

      def process_request
        raise NotImplementedError, "Override process_request in subclass"
      end

      private

      def authentication_hash
        { :username => @credentials.username, :password => @credentials.password }
      end


    end
  end
end