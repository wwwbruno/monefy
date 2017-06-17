class Monefy
  module Matchers
    def == money
      amount.to_f == converted_money_currency(money).to_f
    end

    def > money
      amount.to_f > converted_money_currency(money).to_f
    end

    def < money
      amount.to_f < converted_money_currency(money).to_f
    end
  end
end
