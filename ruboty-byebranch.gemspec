# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/byebranch/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-byebranch"
  spec.version       = Ruboty::Byebranch::VERSION
  spec.authors       = ["tbpgr"]
  spec.email         = ["tbpgr@tbpgr.jp"]

  spec.summary       = %q{An Ruboty Handler + Actions to Delete merged branches.}
  spec.description   = %q{An Ruboty Handler + Actions to Delete merged branches.}
  spec.homepage      = "https://github.com/tbpgr/ruboty-byebranch"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'ruboty'
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
