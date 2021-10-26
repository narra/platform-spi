# Copyright: (c) 2021, Michal Mocnak <michal@narra.eu>, Eric Rosenzveig <eric@narra.eu>
# Copyright: (c) 2021, Narra Project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

require 'narra/extensions'
require 'narra/tools'

module Narra
  module SPI
    class Action
      include Narra::Extensions::Class
      include Narra::Extensions::Meta
      include Narra::Tools::InheritableAttributes

      inheritable_attributes :identifier, :name, :description, :priority, :dependency
      # these are dynamic and has to be initialized on object's creation
      attr_reader :items, :return
      # these are accessible during object's lifecycle
      attr_accessor :event, :returns

      # Connector default values
      @identifier = :generic
      @name = 'Generic'
      @description = 'Generic Action'
      @priority = 42
      # Dependency on connectors
      # Only items from selected connectors will be processed
      # Process all when empty
      @dependency = []

      # Generic constructor to store items to be processed
      def initialize(items)
        @items = items.select { |item| self.class.dependency.empty? or self.class.dependency.include?(item.get_meta(name: 'connector').value.to_sym) }
        # defines return type of an action :json by default
        # it will be used as file extension :json, :xml, :void ( it does not create return object )
        @return = :void
        # default empty returns array
        @returns = []
        # Action specific initialization
        initialization
      end

      #
      # Should be overridden and implemented
      #

      def initialization
        # Nothing to do
        # This can be overridden in descendants
        # Returns array of hashes
        # Hash example
        #
        #   {
        #     # used as a main part of the filename
        #     name: /return_name/
        #     # id field will added during the core initialization and will be ready when perform is called
        #     id: /return_id/
        #     # custom fields can be added as well to identify concrete returns when perform is called
        #   }
        #

      end

      def perform(options = {})
        # Nothing to do
        # This has to be overridden in descendants
        # Returns string as a content when @multi = true
        # Returns hash when @multi = false
        # Hash example:
        #
        #   {
        #     /return_id_1/: /content_string/,
        #     /return_id_2/: /content_string/
        #   }
      end
    end
  end
end
