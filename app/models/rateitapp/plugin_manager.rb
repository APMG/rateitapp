# frozen_string_literal: true
module Rateitapp
  # A manager for the plugins.
  class PluginManager
    def initialize
      @plugins = []
    end

    def add(plugin)
      @plugins << plugin
    end

    def names
      @plugins.map(&:name)
    end

    def plugin_by_name(name)
      @plugins.find { |plugin| plugin.name == name } || NullPlugin.new
    end

    def valid?(rating)
      plugin = plugin_by_name(rating.ratable_type)
      plugin.valid?(rating).tap do |valid|
        rating.errors.add(:base, 'unknown validation issue') unless valid || rating.errors.any?
      end
    end

    # Null object pattern. Consumers don't care about nil, they care about
    # validity. If we don't understand the type, it is always invalid.
    class NullPlugin
      def name
        'null_plugin'
      end

      def valid?(rating)
        rating.errors.add(:ratable_type, 'is not recognized')

        false
      end
    end
  end
end
