# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'luhn/version'

Gem::Specification.new do |spec|
  spec.name          = "luhn-check"
  spec.version       = Luhn::VERSION
  spec.authors       = ["Jan van der Pas"]
  spec.email         = ["janvanderpas@gmail.com"]
  spec.description   = %q{Luhn algorithm checker}
  spec.summary       = %q{Check a number with the Luhn algorithm}
  spec.homepage      = "https://github.com/JanDintel/luhn-check"
  spec.license       = "MIT"
  spec.platform      = Gem::Platform::RUBY

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
