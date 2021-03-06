class Monefy
  # Encapsulate all the logic to convet currencies
  module Converter

    # Converts a Monefy instance froma a currency to another.
    #
    # @param to_currency [String] currency to be converted to.
    #
    # @return [Monefy] new Monefy instance converted to another currency.
    #
    # @example
    #   eur = Monefy.new(50, 'EUR')
    #   eur.convert_to('USD') # => #<Monefy:0x... @amount=55, @currency="USD">
    def convert_to(to_currency)
      validate_currency(to_currency)

      calculated_amount = convert_currency(currency, amount, to_currency)
      create_new_instace(
        calculated_amount,
        to_currency
      )
    end

    private

    def converted_money_currency(money)
      convert_currency(
        money.currency,
        money.amount,
        currency
      ).round(2)
    end

    def convert_currency(from_currency, from_amount, to_currency)
      to_currency_rate = currencies_rates[to_currency]
      from_currency_rate = currencies_rates[from_currency]

      (to_currency_rate * from_amount) / from_currency_rate
    end
  end
end
