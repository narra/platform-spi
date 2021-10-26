# Copyright: (c) 2021, Michal Mocnak <michal@narra.eu>, Eric Rosenzveig <eric@narra.eu>
# Copyright: (c) 2021, Narra Project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

require 'narra/extensions'
require 'narra/tools'

module Narra
  module SPI
    class Listener
      include Narra::Extensions::Class
      include Narra::Tools::InheritableAttributes

      inheritable_attributes :identifier, :name, :description, :priority, :events

      # Connector default values
      @identifier = :generic
      @name = 'Generic'
      @description = 'Generic Listener'
      @priority = 42
      # defines events to listen on
      # :narra_system_initialized
      # :narra_system_log
      # :narra_scenario_library_updated
      # :narra_scenario_project_updated
      # :narra_transcoder_done
      # :narra_transcoder_progress_changed
      @events = []

      #
      # Callbacks should be overriden and implemented
      #

      def narra_system_initialized(options) end
      def narra_system_log(options) end
      def narra_scenario_library_updated(options) end
      def narra_scenario_project_updated(options) end
      def narra_transcoder_done(options) end
      def narra_transcoder_progress_changed(options) end
    end
  end
end
