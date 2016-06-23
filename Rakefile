# frozen_string_literal: true
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

APP_RAKEFILE = File.expand_path('../spec/dummy/Rakefile', __FILE__)
load 'rails/tasks/engine.rake'

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Rateitapp'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

load 'rails/tasks/statistics.rake'

Bundler::GemHelper.install_tasks

Dir[File.join(File.dirname(__FILE__), 'tasks/**/*.rake')].each { |f| load f }

require 'rspec/core'
require 'rspec/core/rake_task'

# desc 'Run all specs in spec directory (excluding plugin specs)'
# RSpec::Core::RakeTask.new(spec: 'app:db:test:prepare')

# This is in here instead of discrete files to avoid autoloading in the
# consuming application.

require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'
require 'brakeman'

desc 'Run Brakeman'
task :brakeman, :output_files do |_t, args|
  files = args[:output_files].split(' ') if args[:output_files]
  Brakeman.run app_path: '.', output_files: files, print_report: true
end

RuboCop::RakeTask.new
RSpec::Core::RakeTask.new(:spec)
Cucumber::Rake::Task.new(:features)

desc 'Run all the tests'
task tests: [:rubocop, :spec, :features, :brakeman]

task default: :tests
