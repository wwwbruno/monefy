class Monefy
  module Converter
    def convert_to(to_currency)
      @amount = convert_currency(currency, amount, to_currency)
      @currency = to_currency

      self
    end

    private

    def converted_money_currency(money)
      convert_currency(money.currency, money.amount, currency)
    end

    def convert_currency(from_currency, from_amount, to_currency)
      converted = (conversion_rates[to_currency] * from_amount) / conversion_rates[from_currency]
      converted.to_f.round(2)
    end

    def conversion_rates
      {
        'EUR'     => 1,
        'USD'     => 1.11,
        'Bitcoin' => 0.0047
      }
    end
  end
end
