# -*- encoding: utf-8 -*-
require File.expand_path('../lib/easy_key_value/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adrien Siami(Intrepidd)"]
  gem.email         = ["adrien.siami@gmail.com"]
  gem.description   = "A simple gem that allows active record models to contain a key / value store for configuration"
  gem.summary       = "A simple gem that allows active record models to contain a key / value store for configuration"
  gem.homepage      = "https://github.com/WizVille/easy_key_value"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "easy_key_value"
  gem.require_paths = ["lib"]
  gem.version       = EKV::VERSION

  gem.add_dependency 'activerecord', '>= 3.1.0'

end

