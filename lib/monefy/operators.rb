class Monefy
  module Operators
    def + money
      new_amount = amount + converted_money_currency(money)

      create_new_instace(new_amount, currency)
    end

    def - money
      new_amount = amount - converted_money_currency(money)

      create_new_instace(new_amount, currency)
    end

    def / value
      new_amount = (amount.to_f / value.to_f)

      create_new_instace(new_amount, currency)
    end

    def * value
      new_amount = (amount.to_f * value.to_f)

      create_new_instace(new_amount, currency)
    end
  end
end
