# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rockin/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nicholas Watson"]
  gem.email         = ["nick@entropi.co"]
  gem.description   = %q{Capistrano tasks for deploying Rails applications using Ubuntu 10.04, rbenv, nginx, Unicorn and PostgreSQL on Entropi Environments.}
  gem.summary       = %q{Capistrano tasks for deploying Rails applications using Ubuntu 10.04, rbenv, nginx, Unicorn and PostgreSQL on Entropi Environments.}
  gem.homepage      = "http://github.com/entropillc/rockin"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rockin"
  gem.require_paths = ["lib"]
  gem.version       = Rockin::VERSION
end
