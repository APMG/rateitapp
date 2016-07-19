class InitializerGenerator < Rails::Generators::Base
  def create_initializer_file
    create_file "config/initializers/rateit.rb", "# Add initialization content here"
  end
end
