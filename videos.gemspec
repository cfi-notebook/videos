lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "videos/version"

Gem::Specification.new do |spec|
  spec.name          = "rb42-videos"
  spec.version       = Videos::VERSION
  spec.authors       = ["Ryan Burnette"]
  spec.email         = ["ryan.burnette@gmail.com"]

  spec.summary       = "Videos is an API for going from a URL to video embed code."
  spec.description   = "Videos is an API for going from a URL to video embed code."
  spec.homepage      = "https://github.com/ryanburnette/videos"
  spec.license       = "ISC"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.2.5'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "html_validation", "~> 1.1"

  spec.add_dependency "httparty", "~> 0.16"
  spec.add_dependency "padrino-helpers", "~> 0.13"
end
