require "monefy/converter"
require "monefy/matchers"
require "monefy/operators"
require "monefy/version"

# Monefy instance with two properties:
# - amount [float] is the quantiy of a currency
# - currency [string] is the string correspondent to the currency
class Monefy
  include Monefy::Converter
  include Monefy::Matchers
  include Monefy::Operators

  attr_reader :amount, :currency

  def initialize(amount, currency)
    validate_currencies_rates
    validate_currency(currency)

    @amount = amount.round(2)
    @currency = currency

    self
  end

  def self.conversion_rates(main_currency, other_currencies)
    @@currencies_rates = other_currencies.merge({ main_currency => 1 })
  end

  def to_s
    "#{'%.02f' % amount} #{currency}"
  end

  private

  def validate_currencies_rates
    raise StandardError, "No conversion rates set" unless defined? @@currencies_rates
  end

  def validate_currency(currency)
    raise StandardError, "Invalid currency" unless @@currencies_rates.include?(currency)
  end

  def currencies_rates
    @@currencies_rates
  end

  def create_new_instace(new_amount, new_currency)
    self.class.new(new_amount, new_currency)
  end
end
