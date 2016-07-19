# frozen_string_literal: true
module Rateitapp
  module Generators
    # Auto generate files in host app
    class InitializerGenerator < Rails::Generators::Base
      def create_initializer_file
        create_file 'config/initializers/rateit.rb', '# Add initialization content here'
      end
    end
  end
end
