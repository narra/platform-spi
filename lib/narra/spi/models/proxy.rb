# Copyright: (c) 2021, Michal Mocnak <michal@narra.eu>, Eric Rosenzveig <eric@narra.eu>
# Copyright: (c) 2021, Narra Project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

module Narra
  module SPI
    module Models
      class Proxy
        # Define attributes
        attr_accessor :name, :type, :source_url, :download_url, :connector, :thumbnails, :options
        # Constructor
        def initialize(name, type, source_url, download_url, connector, thumbnails, options)
          @name = name
          @type = type
          @source_url = source_url
          @download_url = download_url
          @connector = connector
          @thumbnails = thumbnails
          @options = options
        end

        # Default factories
        # Empty proxy object
        def self.empty()
          Narra::SPI::Models::Proxy.new('', :empty, '', '', :generic, [], {})
        end

        # Simple proxy object
        def self.default(name, type, source_url, download_url, connector, thumbnails = [], options = {})
          Narra::SPI::Models::Proxy.new(name, type, source_url, download_url, connector, thumbnails, options)
        end

        # Parse from hash object in sidekiq, using strings
        def self.parse(hash)
          Narra::SPI::Models::Proxy.new(hash['name'], hash['type'].to_sym, hash['source_url'], hash['download_url'], hash['connector'].to_sym, hash['thumbnails'], hash['options'])
        end
      end
    end
  end
end
