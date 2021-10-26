# Copyright: (c) 2021, Michal Mocnak <michal@narra.eu>, Eric Rosenzveig <eric@narra.eu>
# Copyright: (c) 2021, Narra Project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

require 'narra/extensions'
require 'narra/tools'

module Narra
  module SPI
    class Synthesizer
      include Narra::Extensions::Class
      include Narra::Extensions::Options
      include Narra::Extensions::Progress
      include Narra::Tools::InheritableAttributes

      inheritable_attributes :identifier, :title, :description, :options, :dependency, :priority

      # Default values
      @identifier = :generic
      @name = 'Generic'
      @description = 'Generic Synthesizer'
      @options = {}
      @dependency = []
      @priority = 42

      # Generic constructor to store an item to be processed
      def initialize(project, event)
        @project = project
        @event = event
      end

      def model
        @project
      end

      def event
        @event
      end

      #
      # Should be overridden and implemented
      #

      def self.valid?(project_to_check)
        # Nothing to do
        # This has to be overridden in descendants
      end

      def synthesize(options = {})
        # Nothing to do
        # This has to be overridden in descendants
      end

      def self.listeners
        # Nothing to do
        # This can be overridden in descendants
        # It should return array of listener hashes
        # {
        #   instance: Narra::Synthesizers::Generic::Listener.new,
        #   event: :narra_generic_event
        # }
        []
      end
    end
  end
end
