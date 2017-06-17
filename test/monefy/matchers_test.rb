require "test_helper"

describe Monefy::Matchers do
  def test_equal
    fifty_eur_in_usd = Monefy.new(50, 'EUR').convert_to('USD')
    fifty_eur = Monefy.new(50, 'EUR')

    assert_equal true, fifty_eur_in_usd == fifty_eur
  end

  def test_greater
    twenty_dollars = Monefy.new(20, 'USD')
    five_dollars = Monefy.new(5, 'USD')

    assert_equal true, twenty_dollars > five_dollars
  end

  def test_less
    twenty_dollars = Monefy.new(20, 'USD')
    fifty_eur = Monefy.new(50, 'EUR')

    assert_equal true, twenty_dollars < fifty_eur
  end
end
