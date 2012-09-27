# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mini_mongo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Roberto Miranda", "Guillermo Iguaran"]
  gem.email         = ["rjmaltamar@gmail.com", "guilleiguaran@gmail.com"]
  gem.description   = %q{Basics Object Mapper for Mongo}
  gem.summary       = %q{A Ruby Object Mapper for Mongo}
  gem.homepage      = "https://github.com/robertomiranda/mini_mongo"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mini_mongo"
  gem.require_paths = ["lib"]
  gem.version       = MiniMongo::VERSION

  gem.add_dependency "mongo", "~> 1.6.4"
  gem.add_dependency "bson_ext", "~> 1.6.4"
  gem.add_dependency "activesupport", "~> 3.2.7"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency "rake"
end
