# Copyright: (c) 2021, Michal Mocnak <michal@narra.eu>, Eric Rosenzveig <eric@narra.eu>
# Copyright: (c) 2021, Narra Project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

require 'narra/extensions'
require 'narra/tools'

module Narra
  module SPI
    class Auth
      include Narra::Extensions::Class
      include Narra::Tools::InheritableAttributes

      inheritable_attributes :identifier, :name, :description, :requirements

      # Default values
      @identifier = :generic
      @name = 'Generic'
      @description = 'Generic Auth Provider'
      @requirements = []

      def self.valid?
        @requirements.reject { |requirement| ENV.has_key?(requirement) && !ENV[requirement].empty? }.empty?
      end

      #
      # Should be overridden and implemented
      #

      # Auth Provider registration
      def self.call(env)
        # Nothing to do
        # This has to be overridden in descendants
      end
    end
  end
end
