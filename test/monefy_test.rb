require "test_helper"

class MonefyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Monefy::VERSION
  end

  def test_instance_variable
    assert_equal 50, fifty_eur.amount
    assert_equal 'EUR', fifty_eur.currency
  end

  def test_inspect_method
    assert_equal "50.00 EUR", fifty_eur.inspect
  end

  def test_convert_to_method
    assert_equal Monefy.new(55.50, 'USD'), fifty_eur.convert_to('USD')
  end

  def test_plus_operator
    assert_equal Monefy.new(68.02, 'EUR'), (fifty_eur + twenty_dollars)
  end

  def test_minus_operator
    assert_equal Monefy.new(31.98, 'EUR'), (fifty_eur - twenty_dollars)
  end

  def test_splitter_operator
    assert_equal Monefy.new(25, 'EUR'), (fifty_eur / 2)
  end

  def test_multiplier_operator
    assert_equal Monefy.new(60, 'USD'), (twenty_dollars * 3)
  end

  private

  def fifty_eur
    Monefy.new(50, 'EUR')
  end

  def twenty_dollars
    Monefy.new(20, 'USD')
  end
end
