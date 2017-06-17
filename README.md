[![Build Status](https://travis-ci.org/wwwbruno/monefy.svg?branch=master)](https://travis-ci.org/wwwbruno/monefy)

# Monefy

This gem will easily help you to perform currency conversion and arithmetics with different currencies.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'monefy', github: 'wwwbruno/monefy'
```

And then execute:

```
$ bundle
```

## Usage

Create a new Monefy instance passing amount and currency as initializer parameters:

```ruby
fifty_eur = Monefy.new(50, 'EUR')
```

Convert to another currencies:

```ruby
fifty_eur.convert_to('Bitcoin') # => 0.24 Bitcoin
fifty_eur.convert_to('USD') # => 55.50 USD
```

Add and subtract with different currencies:

```ruby
fifty_eur + Monefy.new(20, 'USD') # => 68.02 EUR
fifty_eur - Monefy.new(0.03, 'Bitcoin') # => 43.62 EUR
```

Multiply and divide:

```ruby
fifty_eur / 2 # => 25.00 EUR
Monefy.new(25, 'USD') * 3 # => 75.00 USD
```

Compare different currencies:

```ruby
fifty_eur > Monefy.new(54.55, 'USD') # => true
Monefy.new(180, 'USD') < Monefy.new(0.73, 'Bitcoin') # => false
Monefy.new(54.55, 'USD') == Monefy.new(49.14, 'EUR') # => true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wwwbruno/monefy.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
