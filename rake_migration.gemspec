require_relative 'lib/rake_migration/version'

Gem::Specification.new do |spec|
  spec.name          = "rake_migration"
  spec.version       = RakeMigration::VERSION
  spec.authors       = ["Valerii Kuzin"]
  spec.email         = ["vkuzin@zaraffasoft.com"]

  spec.summary       = "Rake Migration"
  spec.description   = "Gem For Rake Migration"
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
