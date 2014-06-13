# CI::Reporter::TestUnit

Connects [Test::Unit][tu] to [CI::Reporter][ci], and then to your CI
system.

[![Gem Version](https://badge.fury.io/rb/ci_reporter_test_unit.svg)](http://badge.fury.io/rb/ci_reporter_test_unit)
[![Build Status](https://travis-ci.org/ci-reporter/ci_reporter_test_unit.svg?branch=master)](https://travis-ci.org/ci-reporter/ci_reporter_test_unit)
[![Dependency Status](https://gemnasium.com/ci-reporter/ci_reporter_test_unit.svg)](https://gemnasium.com/ci-reporter/ci_reporter_test_unit)
[![Code Climate](https://codeclimate.com/github/ci-reporter/ci_reporter_test_unit.png)](https://codeclimate.com/github/ci-reporter/ci_reporter_test_unit)

[tu]: http://www.ruby-doc.org/stdlib-2.1.2/libdoc/test/unit/rdoc/Test/Unit.html
[ci]: https://github.com/ci-reporter/ci_reporter

## Supported versions

The latest release of Test::Unit 2.5 is supported.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ci_reporter_test_unit'
```

And then install it:

```
$ bundle
```

## Usage

Require the reporter in your Rakefile, and ensure that
`ci:setup:testunit` is a dependency of your RSpec task:

```ruby
require 'ci/reporter/rake/test_unit'

# ...
# Rake code that creates a task called `:testunit`
# ...

task :testunit => 'ci:setup:testunit'
```

### Advanced usage

Refer to the shared [documentation][ci] for details on setting up
CI::Reporter.

## Contributing

1. Fork it ( https://github.com/ci-reporter/ci_reporter_test_unit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
