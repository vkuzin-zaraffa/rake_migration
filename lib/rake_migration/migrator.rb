module RakeMigrations
  class Migrator

    attr_reader :tasks

    def initialize(tasks)
      @tasks = Array(tasks)
    end

    def migrate
      pending_tasks.each { |task| migrate_task(task.name.to_s) }
    end

    class << self
      def migrate(tasks)
        new(tasks).migrate
      end

      def get_migrated_tasks
        TaskMigration.migrated.map { |t| t.name.to_s }
      end
    end


    private

    def migrate_task(task)
      migration = TaskMigration.pending_tasks.by_name(task).first || TaskMigration.new(name: task)

      Rails.logger.info "#{self.class}.#{__method__} Start #{task}: migrating"

      migration.with_lock do
        time = Benchmark.measure do
          Rake::Task[task].invoke
        end

        # Create record
        migration.migrated_at = DateTime.now
        migration.save!
        Rails.logger.info "#{self.class}.#{__method__} #{task}: migrated (#{format('%.4fs', time.real)})"
      end
    rescue => e
      Rails.logger.error "#{self.class}.#{__method__} #{task}: migrated error: (#{e.message})"
    end

    def pending_tasks
      tasks.reject { |task| migrated.include?(task.name) }
    end

    def migrated
      @migrated_tasks ||= Set.new(self.class.get_migrated_tasks)
    end
  end
end

