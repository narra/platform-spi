# Copyright: (c) 2021, Michal Mocnak <michal@narra.eu>, Eric Rosenzveig <eric@narra.eu>
# Copyright: (c) 2021, Narra Project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

require 'narra/extensions'
require 'narra/tools'

module Narra
  module SPI
    class Default
      include Narra::Extensions::Class
      include Narra::Tools::InheritableAttributes

      inheritable_attributes :identifier

      # Default values
      @identifier = :generic

      #
      # Should be overridden and implemented
      #

      def self.settings
        # Nothing to do
        # This has to be overridden in descendants
        # It should return Hash of default settings
        {}
      end

      def self.listeners
        # Nothing to do
        # This can be overridden in descendants
        # It should return array of listener hashes
        # {
        #   instance: Narra::Defaults::Generic::Listener.new,
        #   event: :narra_generic_event
        # }
        []
      end
    end
  end
end
