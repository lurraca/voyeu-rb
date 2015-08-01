# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'voyeurb/version'

Gem::Specification.new do |spec|
  spec.name          = "voyeu-rb"
  spec.version       = Voyeurb::VERSION
  spec.authors       = ["Luis Urraca"]
  spec.email         = ["me@lurraca.com"]

  spec.summary       = %q{Ruby Wrapper for WatchPeopleCode.com API}
  spec.description   = %q{This gem will fetch WatchPeopleCode data about past, live and upcoming streams so you can build cool stuffs with it.}
  spec.homepage      = "https://github.com/lurraca/Voyeu-rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "faraday"
  spec.add_dependency "json"

end
