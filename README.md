[![Gem Version](https://badge.fury.io/rb/monefy.svg)](https://badge.fury.io/rb/monefy)
[![Build Status](https://travis-ci.org/wwwbruno/monefy.svg?branch=master)](https://travis-ci.org/wwwbruno/monefy)
[![Code Climate](https://codeclimate.com/github/wwwbruno/monefy/badges/gpa.svg)](https://codeclimate.com/github/wwwbruno/monefy)
[![Coverage Status](https://coveralls.io/repos/github/wwwbruno/monefy/badge.svg?branch=master)](https://coveralls.io/github/wwwbruno/monefy?branch=master)
[![Inline docs](http://inch-ci.org/github/wwwbruno/monefy.svg?branch=master)](http://inch-ci.org/github/wwwbruno/monefy)

# Monefy

This gem will easily help you to perform currency conversion and arithmetics with different currencies.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'monefy'
```

And then execute:

```
$ bundle
```

## Usage

#### Set your conversion rates on your Initialize file
```ruby
Monefy.conversion_rates('EUR', {
  'USD'     => 1.11,
  'Bitcoin' => 0.0047
}) # => {"USD"=>1.11, "Bitcoin"=>0.0047, "EUR"=>1}
```

#### Create a new Monefy instance passing amount and currency as initializer parameters
```ruby
fifty_eur = Monefy.new(50, 'EUR')
# => #<Monefy:0x... @amount=50.0, @currency="EUR">
```

#### Convert to another currencies
```ruby
fifty_eur.convert_to('USD')
# => #<Monefy:0x... @amount=55.5, @currency="USD">
fifty_eur.convert_to('Bitcoin')
# => #<Monefy:0x... @amount=0.24, @currency="Bitcoin">
```

#### Add and subtract with other Monefy instances with different currencies
```ruby
fifty_eur + Monefy.new(20, 'USD')
# => #<Monefy:0x... @amount=68.02, @currency="EUR">
fifty_eur - Monefy.new(0.03, 'Bitcoin')
# => #<Monefy:0x... @amount=43.62, @currency="EUR">
```

#### Multiply and divide
```ruby
fifty_eur / 2
# => #<Monefy:0x... @amount=25.0, @currency="EUR">
fifty_eur * 3
# => #<Monefy:0x... @amount=150.0, @currency="EUR">
```

#### Compare different currencies:
```ruby
fifty_eur > Monefy.new(54.55, 'USD') # => true
Monefy.new(180, 'USD') < Monefy.new(0.73, 'Bitcoin') # => false
Monefy.new(54.55, 'USD') == Monefy.new(49.14, 'EUR') # => true
Monefy.new(35, 'USD') != Monefy.new(49.14, 'EUR') # => true
```

## Exceptions
#### Instantiate class without setting conversion rates
```ruby
Monefy.new(50, 'USD')
# => StandardError: No conversion rates set

# Solution
# Set your conversion rates on your Initialize file
Monefy.conversion_rates('EUR', {
  'USD'     => 1.11,
  'Bitcoin' => 0.0047
}) # => {"USD"=>1.11, "Bitcoin"=>0.0047, "EUR"=>1}
```

#### Instantiate class or call convert_to to method with invalid current
```ruby
Monefy.new(50, 'INVALID-CURRENCY')
# => StandardError: "Invalid currency"

Monefy.new(50, 'EUR').convert_to('INVALID-CURRENCY')
# => StandardError: "Invalid currency"
```

#### Compare Monefy instance without another Monefy instance
```ruby
Monefy.new(50, 'EUR') == 50
# => StandardError: "Not a Monefy instance"

Monefy.new(50, 'EUR') > "40.0 EUR"
# => StandardError: "Not a Monefy instance"
```

#### Adding or subtracting a Monefy instance without another Monefy instance
```ruby
Monefy.new(50, 'EUR') + 50
# => StandardError: "Not a Monefy instance"

Monefy.new(50, 'EUR') - "40.0 EUR"
# => StandardError: "Not a Monefy instance"
```

#### Splitting or multiplying a Monefy instance without a Numeric
```ruby
Monefy.new(50, 'EUR') / Monefy.new(15, 'EUR')
# => StandardError: "Not a numeric"

Monefy.new(50, 'EUR') * "40.0 EUR"
# => StandardError: "Not a numeric"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wwwbruno/monefy.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
