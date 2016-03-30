# JustRecord

If you ever wanted a gem just like ActiveRecord but just for reading, here you
are! :tada:

This is in progress but the intention (at least for now) is to overwrite all
methods of ActiveRecord::Base that are "too much reponsibility", like `#save`,
`#update` and the callback methods.

With the time, the intention is to evolve this to a easy to use like
ActiveRecord but with single reponsability like ROM.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'justrecord'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install justrecord

## Usage

Just change your `class MyModel < ActiveRecord::Base` to `class MyModel <
JustRecord::Base`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/kelvinst/justrecord. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

