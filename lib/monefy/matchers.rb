class Monefy
  module Matchers
    def == money
      amount == converted_money_currency(money)
    end

    def != money
      amount != converted_money_currency(money)
    end

    def > money
      amount > converted_money_currency(money)
    end

    def < money
      amount < converted_money_currency(money)
    end
  end
end
