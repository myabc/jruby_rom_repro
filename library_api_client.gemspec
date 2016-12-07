# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'library_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = "library_api_client"
  spec.version       = LibraryApiClient::VERSION
  spec.authors       = ["Julien Blanchard"]
  spec.summary       = %q{API client}
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "webmock", "~> 2.1.0"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "rubocop"
  spec.add_dependency "rom-http", "~> 0.5.0"
  spec.add_dependency "contracts", ">= 0.10.0"
end
