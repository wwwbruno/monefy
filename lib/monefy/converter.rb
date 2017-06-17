class Monefy
  module Converter
    def convert_to(to_currency)
      validate_currency(currency)

      new_amount = convert_currency(currency, amount, to_currency)

      create_new_instace(new_amount, to_currency)
    end

    private

    def converted_money_currency(money)
      convert_currency(money.currency, money.amount, currency).round(2)
    end

    def convert_currency(from_currency, from_amount, to_currency)
      (currencies_rates[to_currency] * from_amount) / currencies_rates[from_currency]
    end
  end
end
