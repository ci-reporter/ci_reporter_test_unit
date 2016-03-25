# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ci/reporter/test_unit/version'

Gem::Specification.new do |spec|
  spec.name          = "ci_reporter_test_unit"
  spec.version       = CI::Reporter::TestUnitVersion::VERSION
  spec.authors       = ["Nick Sieger", "Jake Goulding"]
  spec.email         = ["nick@nicksieger.com", "jake.goulding@gmail.com"]
  spec.summary       = %q{Connects CI::Reporter to Test::Unit}
  spec.homepage      = "https://github.com/ci-reporter/ci_reporter_test_unit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features|acceptance)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "test-unit", ">= 2.5.5", "< 4.0"
  spec.add_dependency "ci_reporter", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-collection_matchers"
  spec.add_development_dependency "ci_reporter_test_utils"
end
