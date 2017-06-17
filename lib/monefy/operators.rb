class Monefy
  module Operators
    def + money
      @amount += converted_money_currency(money)

      self
    end

    def - money
      @amount -= converted_money_currency(money)

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
  end
end
