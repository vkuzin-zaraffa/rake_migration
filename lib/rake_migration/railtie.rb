# require 'rake_migration'
require 'rails'

class RakeMigration::Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/rake_migration.rake'
  end
end