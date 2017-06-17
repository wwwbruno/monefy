require "test_helper"

describe Monefy::Arithmetic do
  describe "when set conversion_rates" do
    before do
      Monefy.class_variable_set :@@currencies_rates, nil
      Monefy.conversion_rates('EUR', {
        'USD'     => 1.11,
        'Bitcoin' => 0.0047
      })

      @fifty_eur = Monefy.new(50, 'EUR')
      @twenty_dollars = Monefy.new(20, 'USD')
    end

    describe "with valid parameter: Monefy instance, integer or float" do
      it "returns 68.02 EUR instance when adding 20 USD to 50 EUR" do
        assert_equal Monefy.new(68.02, 'EUR'), @fifty_eur + @twenty_dollars
      end

      it "returns 31.98 EUR instance when subtracting 20 USD to 50 EUR" do
        assert_equal Monefy.new(31.98, 'EUR'), @fifty_eur - @twenty_dollars
      end

      it "returns 25 EUR instance when splitting 50 EUR by 2" do
        assert_equal Monefy.new(25, 'EUR'), @fifty_eur / 2
      end

      it "returns 60 USD instance when splitting 50 EUR by 2" do
        assert_equal Monefy.new(60, 'USD'), @twenty_dollars * 3
      end

      describe "arithmetic in sequence" do
        it "returns corrects values for each operation" do
          assert_equal Monefy.new(124.47, 'EUR'), @fifty_eur + Monefy.new(0.35, 'Bitcoin')
          assert_equal Monefy.new(22.97, 'EUR'), @fifty_eur - Monefy.new(30, 'USD')
          assert_equal Monefy.new(16.67, 'EUR'), @fifty_eur / 3
          assert_equal Monefy.new(125, 'EUR'), @fifty_eur * 2.5
        end
      end
    end

    describe "with invalid parameter" do
      it "raises an error" do
        assert_raises StandardError do
          @fifty_eur + "not a Monefy instance"
        end
      end

      it "raises an error" do
        assert_raises StandardError do
          @fifty_eur - "not a Monefy instance"
        end
      end

      it "raises an error" do
        assert_raises StandardError do
          @fifty_eur / "not a Numeric"
        end
      end

      it "raises an error" do
        assert_raises StandardError do
          @fifty_eur * "not a Numeric"
        end
      end
    end
  end
end
