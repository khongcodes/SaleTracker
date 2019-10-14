# SaleTracker

Welcome to SaleTracker, a basic point-of-sale Sinatra app.

Designed with a framework suitable for selling print material at Massachusetts Independent Comics Expo (MICE).

Features:
1. User registration and log-in
2. Basic data validation in forms
3. User-specific object editing
4. A link to MICE's map and list of exhibitors

Qualifying factors:
- I was going to scrape MICE's map and exhibitor list but I was short on time, and I realized - why bother essentially recreating a webpage as it already exists?

I'll seek to address these in future version updates.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itch_scraper_test'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itch_scraper_test

## Usage

The basic commands which are generally available are:
- Integers 1..10 to access menus and items
- 'q' to quit

The following commands are available based on context (instructions will be printed at each menu):
- 'b' to go back one menu
- 'n' to go to the next page of 10 items
- 'p' to go to the previous page of 10 items
- 'v' to view previously-viewed items
- 'r' to access the root menu

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/khongcodes2/itch_scraper_test.

## Authors

Kevin Hong - https://github.com/khongcodes2/
