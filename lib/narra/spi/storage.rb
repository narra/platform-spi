# Copyright: (c) 2021, Michal Mocnak <michal@narra.eu>, Eric Rosenzveig <eric@narra.eu>
# Copyright: (c) 2021, Narra Project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

require 'narra/extensions'
require 'narra/tools'
require 'carrierwave'

module Narra
  module SPI
    class Storage
      include Narra::Extensions::Class
      include Narra::Tools::InheritableAttributes

      inheritable_attributes :identifier, :name, :description, :requirements

      # Default values
      @identifier = :generic
      @name = 'Generic'
      @description = 'Generic Storage'
      @requirements = []

      # Generic constructor to store an item to be processed
      def initialize
        # storage specific initialization
        CarrierWave.configure do |config|
          initialization(config)
        end
      end

      def self.valid?
        @requirements.reject { |requirement| ENV.has_key?(requirement) && !ENV[requirement].empty? }.empty?
      end

      #
      # Should be overridden and implemented
      #

      # Storage initialization
      def initialization(config)
        # Nothing to do
        # This has to be overridden in descendants
      end

      # Public url link modification
      def url(url)
        # Nothing to do
        # This has to be overridden in descendants
        # Returning same value as default
        url
      end
    end
  end
end
