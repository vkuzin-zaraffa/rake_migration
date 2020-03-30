require 'rake'
require 'benchmark'
require 'rake_migration/migrator'

module RakeMigration
  module Migration

    DEFAULT_TABLE   = 'task_migrations'
    TASK_NAMESPACE  = :rake_migrations

    mattr_accessor :migration_table
    self.migration_table = DEFAULT_TABLE

    mattr_accessor :task_namespace
    self.task_namespace  = TASK_NAMESPACE


    class << self
      def config
        yield self
      end

      def migrate
        RakeMigration::Worker.migrate(tasks)
      end

      def tasks
        with_namespace { |namespace| return namespace.tasks }
      end

      def with_namespace
        Rake.application.in_namespace(task_namespace) do |namespace|
          yield namespace if block_given?
        end
      end
    end
  end
end