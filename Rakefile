require "bundler/gem_tasks"
require 'ci/reporter/test_utils/rake'
include CI::Reporter::TestUtils::Rake

namespace :generate do
  task :clean do
    rm_rf "acceptance/reports"
  end

  task :test_unit do
    run_ruby_acceptance "-rci/reporter/rake/test_unit_loader acceptance/test_unit_example_test.rb"
  end

  task :all => [:clean, :test_unit]
end

task :acceptance => "generate:all"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:acceptance_spec) do |t|
  t.pattern = FileList['acceptance/verification_spec.rb']
  t.rspec_opts = "--color"
end
task :acceptance => :acceptance_spec

RSpec::Core::RakeTask.new(:unit_spec) do |t|
  t.pattern = FileList['spec']
  t.rspec_opts = "--color"
end

task :default => [:unit_spec, :acceptance]
