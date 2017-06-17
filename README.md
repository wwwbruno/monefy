[![Build Status](https://travis-ci.org/wwwbruno/monefy.svg?branch=master)](https://travis-ci.org/wwwbruno/monefy)
[![Code Climate](https://codeclimate.com/github/wwwbruno/monefy/badges/gpa.svg)](https://codeclimate.com/github/wwwbruno/monefy)
[![Inline docs](http://inch-ci.org/github/wwwbruno/monefy.svg?branch=master)](http://inch-ci.org/github/wwwbruno/monefy)

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

```ruby
# Set conversion rates on your Initialize file
Monefy.conversion_rates('EUR', {
  'USD'     => 1.11,
  'Bitcoin' => 0.0047
}) # => {"USD"=>1.11, "Bitcoin"=>0.0047, "EUR"=>1}

# Create a new Monefy instance passing amount and
# currency as initializer parameters
fifty_eur = Monefy.new(50, 'EUR') # => #<Monefy:0x... @amount=50.0, @currency="EUR">

# Convert to another currencies
fifty_eur.convert_to('USD') # => #<Monefy:0x... @amount=55.5, @currency="USD">
fifty_eur.convert_to('Bitcoin') # => #<Monefy:0x... @amount=0.24, @currency="Bitcoin">

# Add and subtract with other Monefy instances
# with different currencies
fifty_eur + Monefy.new(20, 'USD') # => #<Monefy:0x... @amount=68.02, @currency="EUR">
fifty_eur - Monefy.new(0.03, 'Bitcoin') # => #<Monefy:0x... @amount=43.62, @currency="EUR">

# Multiply and divide
fifty_eur / 2 # => #<Monefy:0x... @amount=25.0, @currency="EUR">
fifty_eur * 3 # => #<Monefy:0x... @amount=150.0, @currency="EUR">

# Compare different currencies:
fifty_eur > Monefy.new(54.55, 'USD') # => true
Monefy.new(180, 'USD') < Monefy.new(0.73, 'Bitcoin') # => false
Monefy.new(54.55, 'USD') == Monefy.new(49.14, 'EUR') # => true
Monefy.new(35, 'USD') != Monefy.new(49.14, 'EUR') # => true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wwwbruno/monefy.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
