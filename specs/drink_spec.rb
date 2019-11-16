require ('minitest/autorun')
require ('minitest/reporters')
require_relative('../drink.rb')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class TestDrink < MiniTest::Test

  def setup
    @drink = Drink.new("Tennets", 3, 1)
  end

  def test_drink_name
    assert_equal("Tennets", @drink.name)
  end

  def test_drink_price
    assert_equal(3, @drink.price)
  end

  def test_drink_alcohol
    assert_equal(1, @drink.alcohol)
  end



end
