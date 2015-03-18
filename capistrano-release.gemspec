lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-release"
  gem.version       = '0.1'
  gem.authors       = "Rustam Zagirov"
  gem.email         = "stammru@gmail.com"
  gem.description   = %q{Cat release file if it changes}
  gem.summary       = %q{Cat release file if it changes}
  gem.homepage      = "https://github.com/stamm/capistrano-release"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'capistrano', '~> 3.1'

  gem.required_ruby_version = '>= 2.0.0'
end
