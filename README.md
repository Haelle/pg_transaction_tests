# README

Test repository to show the strange behavior of table lock with PG (during a transaction with a truncate table)

## Setup
run with pg superuser:
```
create role transaction_tests with createdb login password 'password';
```

And classic rails setup:
```
bundle exec rails db:create
bundle exec rails db:migrate
```

## How to reproduce bug
open 2 terminals;

1. in rails console: `User.all` => should be empty
2. in terminal: `bundle exec rake pg:setup` => creates a user
3. in rails console: `User.all` => returns created user
4. in terminal: `bundle exec rake pg:transaction` => transaction stuck with Pry, keep it this way
5. in rails console: `User.all` => Rails does not respond !

If you this again but removing the truncate table statement (ln.8 in `lib/tasks/pg.rake`) you can access the data in step 5.
