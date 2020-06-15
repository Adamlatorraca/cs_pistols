require_relative 'lib/cs_pistols/version'

Gem::Specification.new do |spec|
  spec.name          = "cs_pistols"
  spec.version       = CsPistols::VERSION
  spec.authors       = ["Adamlatorraca"]
  spec.email         = ["adam.latorraca@gmail.com"]

  spec.summary       = %q{"A reference guide for CS:GO Pistols"}
  spec.description   = %q{"Choosing a weapon gives the user detailed statistics about each pistol in the video game CS:GO"}
  spec.homepage      = "http://replacesite.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://replacesite.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://replacesite.com"
  spec.metadata["changelog_uri"] = "http://replacesite.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
