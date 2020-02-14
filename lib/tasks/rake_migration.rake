namespace :rake_migration do
  desc 'Add migration CreateTaskMigrations'
  task :install  do
    system("rails generate migration CreateTaskMigrations name:string:index migrated_at:datetime")
  end

  desc 'Run Rake Tasks Migration'
  task run: :environment do
    puts "[INFO] Start rake migration".green
    migration = RakeMigration::Migration.migrate
    puts "[INFO] Done #{migration.count} migration: #{migration}".green
  end
end
