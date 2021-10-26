# Copyright: (c) 2021, Michal Mocnak <michal@narra.eu>, Eric Rosenzveig <eric@narra.eu>
# Copyright: (c) 2021, Narra Project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

require 'uri'
require 'narra/extensions'
require 'narra/tools'

module Narra
  module SPI
    # Generic template for generators
    class Connector
      include Narra::Extensions::Class
      include Narra::Tools::InheritableAttributes

      inheritable_attributes :identifier, :name, :description, :priority
      attr_reader :proxy, :metadata, :source_url, :download_url

      # Connector default values
      @identifier = :generic
      @name = 'Generic'
      @description = 'Generic Connector'
      @priority = 42

      # Generic constructor to store an item to be processed
      def initialize(proxy = Narra::Tools::Proxy.empty)
        @source_url = proxy.source_url
        @proxy = proxy
        @metadata = []
        # connector specific processing
        process
      end

      #
      # Should be overridden and implemented
      #

      def self.valid?(source_url)
        # Validates url if it's suitable for this connector
        # Nothing to do here
        # This has to be overridden in descendants
      end

      def self.resolve(source_url)
        # Resolves url for concrete items and create proxy items
        # This can processes multiple items
        # Nothing to do here
        # This has to be overridden in descendants
      end

      def process
        # Processes proxy item into regular one
        # This processes only one item
        # Nothing to do here
        # This has to be overridden in descendants
      end
    end
  end
end
