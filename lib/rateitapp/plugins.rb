# frozen_string_literal: true
module Rateitapp
  def self.plugin_manager
    @plugin_manager ||= PluginManager.new
  end
end
