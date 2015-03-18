# Capistrano::Release

Really help not to forget do a one time stuff after/before deploy.

You put a needing text in file doc/do_on_release.txt (or you particular sets in variable release_file), like: «Reindex index» or «Run rake stat:count»

On deploy cats this file if context is change

Options.

```ruby
set :release_file, fetch(:release_file, 'doc/do_on_release.txt') // What file compare
set :release_ask, fetch(:release_ask, true) // Pause deploy after cat changes release
```

Add this line to your application's Gemfile:

    gem 'capistrano',  '~> 3.4'
    gem 'capistrano-release', '~> 0.1'

## Usage

Require

    # Capfile
    require 'capistrano/release'

Please note that any `require` should be placed in `Capfile`, not `config/deploy.rb`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
