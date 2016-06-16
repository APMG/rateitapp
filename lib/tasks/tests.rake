require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

RuboCop::RakeTask.new
RSpec::Core::RakeTask.new(:spec)
Cucumber::Rake::Task.new(:features)

desc 'Run all the tests'
task tests: [:rubocop, :spec, :features]
