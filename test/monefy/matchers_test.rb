require "test_helper"

describe Monefy::Matchers do
  describe "when set conversion_rates" do
    before do
      Monefy.class_variable_set :@@currencies_rates, nil
      Monefy.conversion_rates('EUR', {
        'USD'     => 1.11,
        'Bitcoin' => 0.0047
      })

      @fifty_eur = Monefy.new(50, 'EUR')
      @twenty_dollars =Monefy.new(20, 'USD')
    end

    it "matches 50 EUR equals to 50 EUR converted to USD" do
      assert_equal true, @fifty_eur == @fifty_eur.convert_to('USD')
    end

    it "matches 20 USD greater than 10 EUR" do
      assert_equal true, @twenty_dollars > Monefy.new(10, 'EUR')
    end

    it "matches 20 USD less than 1.12 Bitcoin" do
      assert_equal true, @twenty_dollars < Monefy.new(0.12, 'Bitcoin')
    end
  end
end
