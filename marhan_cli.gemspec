# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marhan_cli/version'

Gem::Specification.new do |gem|
  gem.name = "marhan_cli"
  gem.version = MarhanCli::VERSION
  gem.platform = Gem::Platform::RUBY
  gem.authors = "Markus Hanses"
  gem.email = "me@markushanses.de"
  gem.summary = "Helper routines for my computers"
  gem.homepage = "https://github.com/marhan/marhan_cli"

  gem.files = `git ls-files`.split($/)
  gem.executables = 'mcli'
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency('thor')
  gem.add_runtime_dependency('net-ssh', '~> 2.6.1')
  gem.add_runtime_dependency('ambience', '~> 2.0.0')
end
