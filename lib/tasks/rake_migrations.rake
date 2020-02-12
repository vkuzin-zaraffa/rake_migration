namespace :task_migration do
  task install: :environment do
    system("rails generate migration CreateTaskMigrations name:string:index migrated_at:datetime")
  end

  task run: :environment do
    puts "[INFO] Start rake migration".green
    migration = RakeMigrations::Migration.migrate
    puts "[INFO] Done #{migration.count} migration: #{migration}".green
  end
end
