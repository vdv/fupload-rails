# -*- encoding: utf-8 -*-
require File.expand_path('../lib/file-uploader-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Vladislav Druzhinin"]
  gem.email         = ["vlad@druzh.ru"]
  gem.description   = "The file-uploader-rails gem integrates the file-uploader (https://github.com/valums/file-uploader)."
  gem.summary       = ""
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "file-uploader-rails"
  gem.require_paths = ["lib"]
  gem.version       = File::Uploader::Rails::VERSION
end
