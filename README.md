# Game of Life App

This is a [Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) game application.

## Development

### Ruby Version

Ruby version is placed in `.ruby-version` file. Ruby verison manager like **[rbenv](https://github.com/rbenv/rbenv)** can be used to install and run locally.

### Format

Rubocop Gem is currently being used for autoformat. To run:

```bundle exec rubocop -A```

Or set up your IDE to run on save.

Cops or rules can be modified to be ignored by adding a `.rubocop.yml` on the root of your directory and adding "Cops" to it.
