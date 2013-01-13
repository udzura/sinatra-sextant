# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra/sextant/version'

Gem::Specification.new do |gem|
  gem.name          = "sinatra-sextant"
  gem.version       = Sinatra::Sextant::VERSION
  gem.authors       = ["Uchio KONDO"]
  gem.email         = ["udzura@udzura.jp"]
  gem.description   = %q{A fancy DSL for Sinatra routing}
  gem.summary       = %q{A fancy DSL for Sinatra routing}
  gem.homepage      = "https://github.com/udzura/sinatra-sextant"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'sinatra', '>= 1.3.0'
  gem.add_development_dependency 'rspec', '>= 2.10'
  gem.add_development_dependency 'rack-test', '>= 0'
  gem.add_development_dependency 'sinatra-contrib', '>= 0'
  gem.add_development_dependency 'pry', '>= 0'
end
