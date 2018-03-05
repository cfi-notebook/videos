lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "videos/version"

Gem::Specification.new do |spec|
  spec.name          = "videos"
  spec.version       = Videos::VERSION
  spec.authors       = ["Ryan Burnette"]
  spec.email         = ["ryan.burnette@gmail.com"]

  spec.summary       = "Accept the URL to a video and generate embed code or other useful attributes."
  spec.description   = "Accept the URL to a video and generate embed code or other useful attributes."
  spec.homepage      = "https://github.com/ryanburnette/videos"
  spec.license       = "ISC"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "html_validation"

  spec.add_dependency "httparty"
  spec.add_dependency "actionview"
end
