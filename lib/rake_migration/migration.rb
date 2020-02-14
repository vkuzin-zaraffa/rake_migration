require 'rake'
require 'benchmark'
require 'rake_migration/migrator'

module RakeMigration
  module Migration

    DEFAULT_TABLE_NAME = 'task_migrations'
    DEFAULT_NAMESPACE  = :rake_migrations

    mattr_accessor :migration_table_name
    self.migration_table_name = DEFAULT_TABLE_NAME

    mattr_accessor :migration_namespace
    self.migration_namespace  = DEFAULT_NAMESPACE


    class << self
      def config
        yield self
      end

      def migrate
        RakeMigration::Migrator.migrate(tasks)
      end

      def tasks
        with_namespace { |namespace| return namespace.tasks }
      end

      def with_namespace
        Rake.application.in_namespace(migration_namespace) do |namespace|
          yield namespace if block_given?
        end
      end
    end
  end
end