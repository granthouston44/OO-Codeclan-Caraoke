require('minitest/autorun')
require('minitest/reporters')
require_relative('../food')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class FoodTest < MiniTest::Test

  def setup

    @food = Food.new("Burger", 5, 3.5)
  end

  def test_food_namea
    assert_equal("Burger", @food.name)
  end

  def test_food_price
    assert_equal(5, @food.price)
  end

  def test_food_rejuvenation
    assert_equal(3.5, @food.rejuvenation)
  end



end
