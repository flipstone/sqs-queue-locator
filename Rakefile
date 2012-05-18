require "bundler/gem_tasks"

Bundler.require :default, :development

task default: :spec

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
  t.rspec_opts = "--color"
end

