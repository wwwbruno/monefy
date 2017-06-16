class Monefy
  module Operators
    def + money
      @amount += convert_currency(money.currency, money.amount, currency)

      self
    end

    def - money
      @amount -= convert_currency(money.currency, money.amount, currency)

      self
    end

    def == money
      converted_amount = convert_currency(money.currency, money.amount, currency)
      amount.to_f == converted_amount.to_f
    end
  end
end
