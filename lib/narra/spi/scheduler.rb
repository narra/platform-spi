# Copyright: (c) 2021, Michal Mocnak <michal@narra.eu>, Eric Rosenzveig <eric@narra.eu>
# Copyright: (c) 2021, Narra Project
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

require 'narra/extensions'
require 'narra/tools'
require 'sidekiq-scheduler'

module Narra
  module SPI
    class Scheduler
      include Sidekiq::Worker
      include Narra::Extensions::Class
      include Narra::Tools::InheritableAttributes

      inheritable_attributes :identifier, :name, :description, :interval

      # Default values
      @identifier = :generic
      @name = 'Generic'
      @description = 'Generic Scheduler'
      @interval = '10s'

      def perform
        # Nothing to do
        # This has to be overridden in descendants
      end
    end
  end
end
