require "rake_migration/migration"
require 'rake_migration/version'
require 'rake_migration/task_migration'
require "rake_migration/railtie" if defined?(Rails)

module RakeMigration
  class Error < StandardError; end
end
