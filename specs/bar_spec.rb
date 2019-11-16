require('minitest/autorun')
require('minitest/reporters')

require_relative('../bar')
require_relative('../drink')
require_relative('../guest')
require_relative('../room')
require_relative('../food')


MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class BarTabTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Jefferson", 60, "Shoot to thrill", 18)
    @guest2 = Guest.new("Francis",20, "Ocean Avenue",15)

    @drink1 = Drink.new("Tennets", 3, 1)
    @drink2 = Drink.new("Strongbow", 4, 1.5)
    @drink3 = Drink.new("Buckie", 6, 4)
    @drinks = [@drink1, @drink2, @drink3]

    @food = Food.new("Burger", 5, 3.5)

    @bar = BarTab.new(@drinks)

    @room1 = Room.new(1, @playlist1)
  end

  def test_get_age
    assert_equal(18, @guest1.age)
  end

  def test_drinks_stock
    assert_equal(3, @bar.stock_count)
  end

  def test_remove_drink
    @bar.sell_drink(@drink3)
    assert_equal(2, @bar.stock_count)
  end

  def test_add_money_to_tab
    @bar.add_money(@drink3, @room1)
    assert_equal(6, @room1.bill)
  end

  def test_customer_overage
    #given

    #then
    result = @bar.of_age?(@guest1)
    #when
    assert_equal(true, result)
  end

  def test_customer_underage
    result = @bar.of_age?(@guest2)
    assert_equal(false, result)
  end

  def test_customer_drunk_level_drunk
    @bar.buy_drink(@drink3, @guest1, @room1)
    @bar.buy_drink(@drink3, @guest1, @room1)
    @bar.buy_drink(@drink3, @guest1, @room1)

    result = @bar.service(@guest1, @drink1, @room1)

    assert_equal("Stomach pumped mate!", result)
  end

  def test_customer_drunk_level_sober
    result = @bar.service(@guest1, @drink3, @room1)
    assert_equal("Here ye go mate!", result)
  end

  def test_buy_drink_sober
    # @guest1.buy_drink(@drink3, @bar)
    # @guest1.buy_drink(@drink3, @bar)
    # @guest1.buy_drink(@drink3, @bar)
    # @guest1.buy_drink(@drink2, @bar)
    @bar.service(@guest1, @drink3, @room1)
    # @bar.service(@guest1, @drink3)
    # @bar.service(@guest1, @drink3)
    # @bar.of_age?(@guest1)
    assert_equal(1, @guest1.drink_count)
    assert_equal(54, @guest1.wallet)
    assert_equal(2, @bar.stock_count)
    assert_equal(6, @room1.bill)
    assert_equal(4, @guest1.drunk_level)
  end

  def test_buy_drink_not_served_too_drunk
    @bar.service(@guest1, @drink3, @room1)
    @bar.service(@guest1, @drink3, @room1)
    @bar.service(@guest1, @drink3, @room1)
    @bar.service(@guest1, @drink3, @room1)
    assert_equal(3, @guest1.drink_count)
    assert_equal(42, @guest1.wallet)
    assert_equal(2, @bar.stock_count)
    assert_equal(18, @room1.bill)
    assert_equal(12, @guest1.drunk_level)
  end

  def test_buy_drink_too_young
    @bar.service(@guest2, @drink3, @room1)
    assert_equal(0, @guest2.drink_count)
    assert_equal(20, @guest2.wallet)
    assert_equal(3, @bar.stock_count)
    assert_equal(0, @room1.bill)
    assert_equal(0, @guest2.drunk_level)
  end

  def test_food_gets_added_to_bill
    @guest1.buy_food(@food, @room1)
    assert_equal(5, @room1.bill)
  end


end
