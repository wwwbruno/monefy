require "test_helper"

describe Monefy::Converter do
  describe "when set conversion_rates" do
    before do
      Monefy.class_variable_set :@@currencies_rates, nil
      Monefy.conversion_rates('EUR', {
        'USD'     => 1.11,
        'Bitcoin' => 0.0047
      })

      @fifty_eur = Monefy.new(50, 'EUR')
    end

    it "converts 50 EUR to 55.50 USD" do
      assert_equal Monefy.new(55.50, 'USD'), @fifty_eur.convert_to('USD')
    end

    it "converts 50 EUR to 0.24 Bitcoin" do
      assert_equal Monefy.new(0.24, 'Bitcoin'), @fifty_eur.convert_to('Bitcoin')
    end

    it "access a Monefy instance variables" do
      assert_raises(StandardError, "No conversion rates set") do
        Monefy.new(50, 'EUR').convert_to('BRL')
      end
    end
  end
end
