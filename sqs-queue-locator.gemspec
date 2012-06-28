# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sqs-queue-locator/version"

Gem::Specification.new do |s|
  s.name        = "sqs-queue-locator"
  s.version     = Sqs::Queue::Locator::VERSION
  s.authors     = ["David Vollbracht"]
  s.email       = ["david@flipstone.com"]
  s.homepage    = "http://github.com/flipstone/sqs-queue-locator"
  s.summary     = %q{Implements a naming conversion for SQS queues in multiple environments}
  s.description = <<-end_desc
Amazon SQS queue names need to be unique at the account level.
This gem implements a simple naming convention of <environment>-<queue-name> to
allow your app to have keep track of queues per environment.

For the development environment, an extra prefix is added based on your machine's
hostname so that multiple developers can work at the same time without stepping
on each others' queues.
  end_desc

  s.rubyforge_project = "sqs-queue-locator"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  # s.add_runtime_dependency "rest-client"
end
