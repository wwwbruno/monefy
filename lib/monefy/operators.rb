class Monefy
  module Operators
    def + money
      @amount += converted_amount(money)

      self
    end

    def - money
      @amount -= converted_amount(money)

      self
    end

    def / integer
      @amount = (amount / integer)

      self
    end

    def * integer
      @amount = (amount * integer)

      self
    end

    def == money
      amount.to_f == converted_amount(money).to_f
    end

    private

    def converted_amount(money)
      convert_currency(money.currency, money.amount, currency)
    end
  end
end
