# coding: utf-8
lib = File.expand_path('./lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/matriz/version'

Gem::Specification.new do |spec|
  spec.name          = "matriz"
  spec.version       = Matriz::VERSION
  spec.authors       = ["Daura Hernández"]
  spec.email         = ["alu0100600643@ull.edu.es"]
  spec.description   = %q{Matriz ipsum generator}
  spec.summary       = %q{Simply generates matriz ipsum text.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
