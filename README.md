# Game of Life App

This is a [Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) game application.

**Game** gets created with an **initial seed**. The seed may be seen as the initial state of all **Cells**.

A **Cell** represents a node or "pixel" within the game.

To run app:

```
$ bundle install
$ yarn install
$ rails s
```

Visit **http://localhost:3000**.

### Rules

Valid rules for game are placed under `lib/game_rules/`. They return **true** or **false**, for alive or dead cell status, respectively. Or **nil** if no action required.

## Development

### Ruby Version

Ruby version is placed in `.ruby-version` file. Ruby verison manager like **[rbenv](https://github.com/rbenv/rbenv)** can be used to install and run locally.

```$ bundle install```

### Format

Rubocop Gem is currently being used for autoformat. To run:

```$ bundle exec rubocop -A```

Or set up your IDE to run on save.

Cops or rules can be modified to be ignored by adding a `.rubocop.yml` on the root of your directory and adding "Cops" to it.

### Node Version

Node version is placed in `.nvmrc` file. You may use a Node Version Manager like **[nvm]**(https://github.com/nvm-sh/nvm).

Yarn is used for JavaScript package manager.

```$ yarn install```

### Testing

Ruby and RoR code is coverd. To run:

```$ bundle exec rspec```
