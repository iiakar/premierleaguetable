require_relative 'lib/league_table/version'

Gem::Specification.new do |spec|
  spec.name          = "league_table"
  spec.version       = LeagueTable::VERSION
  spec.authors       = ["“[Ibrahim Akar"]
  spec.email         = ["“[genomebinary@gmail.com]”"]

  spec.summary       = %q{English Premier League Standings}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/iiakar/premierleaguetable.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/iiakar/premierleaguetable.git"
  spec.metadata["changelog_uri"] = "https://github.com/iiakar/premierleaguetable.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = "table"
  spec.require_paths = ["lib"]
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "bundler"
  spec.add_dependency "nokogiri"
end
