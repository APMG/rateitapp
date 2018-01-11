# frozen_string_literal: true

require 'active_model_serializers'
require 'kaminari'

module Rateitapp
  # The base Engine.
  class Engine < ::Rails::Engine
    isolate_namespace Rateitapp

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
