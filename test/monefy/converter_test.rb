require "test_helper"

describe Monefy::Converter do
  def test_convert_to_method
    fifty_eur_in_usd = Monefy.new(50, 'EUR').convert_to('USD')

    assert_equal Monefy.new(55.50, 'USD'), fifty_eur_in_usd
  end
end
