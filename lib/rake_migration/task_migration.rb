module RakeMigration
  class TaskMigration < ::ActiveRecord::Base

    RAKE_KEY_REGEX = /\A[a-z\_0-9\:]+\z/

    scope :migrated,   -> { where.not(migrated_at: nil) }
    scope :new_tasks,  -> { where(migrated_at: nil) }
    scope :by_name,    ->(name) { where(name: name) }

    validates :name, presence: true, format: { with: RAKE_KEY_REGEX }, uniqueness: true
  end
end