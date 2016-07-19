# frozen_string_literal: true
require 'rails/generators/active_record'
require 'rails/generators/migration'

module Rateitapp
  module Generators
    # Auto generate files in host app
    class InstallGenerator < Rails::Generators::Base
      def create_initializer_file
        create_file 'config/initializers/rateit.rb', '# Add initialization content here'
      end
    end
  end
end
