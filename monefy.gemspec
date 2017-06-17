# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "monefy/version"

Gem::Specification.new do |spec|
  spec.name          = "monefy"
  spec.version       = Monefy::VERSION
  spec.authors       = ["Bruno Almeida"]
  spec.email         = ["brunom.almd@gmail.com"]

  spec.summary       = "Perform currency conversion and arithmetics with different currencies."
  spec.description   = "Perform currency conversion and arithmetics with different currencies."
  spec.homepage      = "https://github.com/wwwbruno/monefy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
