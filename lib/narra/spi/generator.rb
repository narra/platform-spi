# Copyright: (c) 2021, Michal Mocnak <michal@narra.eu>, Eric Rosenzveig <eric@narra.eu>
# Copyright: (c) 2021, Narra Project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

require 'narra/extensions'
require 'narra/tools'

module Narra
  module SPI
    class Generator
      include Narra::Extensions::Class
      include Narra::Extensions::Meta
      include Narra::Extensions::Progress
      include Narra::Extensions::Options
      include Narra::Tools::InheritableAttributes

      inheritable_attributes :identifier, :name, :description, :options, :dependency, :priority

      # Default values
      @identifier = :generic
      @name = 'Generic'
      @description = 'Generic Generator'
      @options = {}
      @dependency = []
      @priority = 42

      # Generic constructor to store an item to be processed
      def initialize(item, event)
        @item = item
        @event = event
        # connector specific initialization
        initialization
      end

      def model
        @item
      end

      def event
        @event
      end

      #
      # Should be overridden and implemented
      #

      def self.valid?(item_to_check)
        # Nothing to do
        # This has to be overridden in descendants
      end

      def initialization
        # Nothing to do
        # This has to be overridden in descendants
      end

      def generate(options = {})
        # Nothing to do
        # This has to be overridden in descendants
      end
    end
  end
end
