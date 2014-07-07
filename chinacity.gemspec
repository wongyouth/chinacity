# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chinacity/version'

Gem::Specification.new do |spec|
  spec.name          = "chinacity"
  spec.version       = Chinacity::VERSION
  spec.authors       = ["Ryan Wang"]
  spec.email         = ["wongyouth@gmail.com"]
  spec.summary       = %q{Get China cities data from China Official site}
  spec.description   = %q{Get China cities data from China official site}
  spec.homepage      = "http://github.com/wongyouth/chinacity"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "chinese_pinyin"
  spec.add_dependency "json"
  spec.add_dependency "nokogiri"
  spec.add_dependency "httparty"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
