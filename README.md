# Voyeu-rb

Voyeu-rb is a Ruby Wrapper for the [WatchPeopleCode.com](http://watchpeople.code.com) API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'voyeur'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install voyeurb

## Usage

**List live streams**

```ruby
Voyeurbb::Stream.live
```

**List upcoming streams**

```ruby
Voyeurb::Stream.upcoming
```

**List completed streams**

 ```ruby
Voyeurb::Stream.completed
```

**Get information of the stream by ID**

```ruby
Voyeurb::Stream.find(:id)
```

**List all streamers**

```ruby
Voyeurb::Streamer.all
```

**Get information of a streamer by name**

```ruby
Voyeurb::Streamer.find_by_name(:name)
```

**List live streams of a streamer**

```ruby
Voyeurb::Streamer.find_by_name(:name).live
```

**List upcoming streams of a streamer**

```ruby
Voyeurb::Streamer.find_by_name(:name).upcoming
```

**List completed streams of a streamer**

```ruby
Voyeurb::Streamer.find_by_name(:name).completed
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lurraca/voyeu-rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

