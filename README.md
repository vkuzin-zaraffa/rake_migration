# RakeMigration

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rake_migration'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rake_migration

Add gem DB migration

    $ rake rake_migration:install
    $ rails db:migrate
    
## Usage

Added to config/initializers/rake_migration.rb 

```ruby
RakeMigrations::Migration.migrate
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rake_migration. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rake_migration/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RakeMigration project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rake_migration/blob/master/CODE_OF_CONDUCT.md).
