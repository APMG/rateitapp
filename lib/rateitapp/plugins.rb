# frozen_string_literal: true

# Main namespace.
module Rateitapp
  def self.plugin_manager
    @plugin_manager ||= PluginManager.new
  end
end
