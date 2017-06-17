require "test_helper"

describe Monefy do
  def test_instance_variable
    fifty_eur = Monefy.new(50, 'EUR')

    assert_equal 50, fifty_eur.amount
    assert_equal 'EUR', fifty_eur.currency
  end

  def test_inspect_method
    fifty_eur = Monefy.new(50, 'EUR')

    assert_equal "50.00 EUR", fifty_eur.inspect
  end
end
