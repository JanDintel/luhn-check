# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'luhn/check/version'

Gem::Specification.new do |spec|
  spec.name          = "luhn-check"
  spec.version       = Luhn::Check::VERSION
  spec.authors       = ["Jan van der Pas"]
  spec.email         = ["janvanderpas@gmail.com"]
  spec.description   = %q{Luhn algorithm checker}
  spec.summary       = %q{Check a number with the Luhn algorithm}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
