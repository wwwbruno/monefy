require "monefy/converter"
require "monefy/matchers"
require "monefy/arithmetic"
require "monefy/version"

# Monefy instance with two attr_reader
#
# @attr_reader amount [Float] is the quantiy of a currency.
# @attr_reader currency [String] is the string correspondent to the currency.
class Monefy
  include Monefy::Converter
  include Monefy::Matchers
  include Monefy::Arithmetic

  attr_reader :amount, :currency

  # To create a new instance, pass amout and current as parameters
  #
  # @param amount [Integer, Float] quantiy of a currency.
  # @param currency [String] currency key created on `conversion_rates` method.
  #
  # @return [Monefy] all currencies conversion rate.
  #
  # @example
  #   Monefy.new(50, 'EUR') # => #<Monefy:0x... @amount=50.0, @currency="EUR">
  #
  # See 'self.conversion_rates' methdo before initializa a new instance
  def initialize(amount, currency)
    validate_currencies_rates
    validate_currency(currency)

    @amount = amount.round(2)
    @currency = currency

    self
  end

  # Set default currencies and conversion rates
  # used to calculate conversions.
  #
  # Use this method on your initilizer application
  # config
  #
  # @param main_currency [String] main currency.
  # @param other_currencies [Hash] currencies relatives to main currency with
  # key with other currency and value with conversion rate.
  #
  # @return [Hash] all currencies conversion rate.
  #
  # @example
  #   Monefy.conversion_rates('EUR', {
  #     'USD'     => 1.11,
  #     'Bitcoin' => 0.0047
  #   }) # => {"USD"=>1.11, "Bitcoin"=>0.0047, "EUR"=>1}
  def self.conversion_rates(main_currency, other_currencies)
    @@currencies_rates = other_currencies.merge({ main_currency => 1 })
  end

  # Return Monefy instance string value
  #
  # @return [String] currency and amout string.
  #
  # @example
  #   Monefy.new(50, 'EUR').to_s # => "50.00 EUR"
  #   "#{Monefy.new(50, 'EUR')}" # => "50.00 EUR"
  def to_s
    "#{'%.02f' % amount} #{currency}"
  end

  private

  def validate_currencies_rates
    return if defined?(@@currencies_rates) && @@currencies_rates.present?

    raise StandardError, "No conversion rates set"
  end

  def validate_currency(currency)
    return if @@currencies_rates.key? currency

    raise StandardError, "Invalid currency"
  end

  def validate_monefy_instance(monefy)
    return if monefy.instance_of? Monefy

    raise StandardError, "Not a Monefy instance"
  end

  def currencies_rates
    @@currencies_rates
  end

  def create_new_instace(new_amount, new_currency)
    self.class.new(new_amount, new_currency)
  end
end
