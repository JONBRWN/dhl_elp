module DhlElp
  module Helpers

    private
    # String or :symbol to CamelCase
    def camelize(s)
      # s.to_s.split('_').map 
      s.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
    end

    # Helper method to validate required fields
    def requires!(hash, *params)
      params.each { |param| raise RequestError, "Missing Required Parameter #{param}" if hash[param].nil? }
    end

    # Helper method to convert keys to underscores
    def underscorize(key)
      key.to_s.sub(/^(v[0-9]+|ns):/, "").gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').gsub(/([a-z\d])([A-Z])/,'\1_\2').downcase
    end

  end
end