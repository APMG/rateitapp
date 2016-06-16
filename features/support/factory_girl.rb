# frozen_string_literal: true
require 'factory_girl'
World(FactoryGirl::Syntax::Methods)
FactoryGirl.definition_file_paths << File.join(File.dirname(__FILE__), '../../spec/factories')
FactoryGirl.find_definitions
