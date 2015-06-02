# RUUID

RUUID (Ruby UUID) parses, generates, and represents [RFC 4122][RFC 4122]
universally unique identifiers. Currently, only v4 UUIDs can be generated by
this library.

[RFC 4122]: https://www.ietf.org/rfc/rfc4122.txt

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruuid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruuid

## Example Usage

```ruby
require 'ruuid'

uuid = RUUID.generate
# => <RUUID::UUID:0x70168845476220 data=7cc9f80c-c2e2-4d03-ad35-1e3112dc77de>

uuid.version
# => 4

uuid.to_s
# => "7cc9f80c-c2e2-4d03-ad35-1e3112dc77de"
uuid.to_s(:compact)
# => "7cc9f80cc2e24d03ad351e3112dc77de"
```

See [API documentation](http://www.rubydoc.info/docs/ruuid) for
additional information.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release` to create a git tag for the version, push git commits
and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/hashrabbit/ruuid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
