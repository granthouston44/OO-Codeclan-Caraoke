require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest')
require_relative('../room')
require_relative('../bar')
require_relative('../drink')
require_relative('../food')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class TestGuest < MiniTest::Test

  def setup
    @person1 = Guest.new("Grant", 50, "Shoot to thrill", 26)
    @person2 = Guest.new("Ailsa", 50, "Ocean Avenue", 17)

    @drink1 = Drink.new("Tennets", 3, 1)
    @drink2 = Drink.new("Strongbow", 4, 1.5)
    @drink3 = Drink.new("Buckie", 6, 4)
    @drinks = [@drink1, @drink2, @drink3]

    @food = Food.new("Burger", 5, 3.5)

    @bar = BarTab.new(@drinks)

    @room1 = Room.new(1, @playlist1)
    @room2 = Room.new(2, @playlist2)
  end

  def test_can_get_name
    assert_equal("Grant", @person1.name)
  end

  def test_can_get_wallet
    assert_equal(50, @person1.wallet)
  end

  def test_can_get_fav_song
    assert_equal("Shoot to thrill", @person1.fav_song)
  end

  def test_spend_money
    @person1.pay_fee(10)
    assert_equal(40, @person1.wallet)
  end

  def test_customer_name
    assert_equal("Grant", @person1.name)
  end

  def test_customer_wallet
    assert_equal(50, @person1.wallet)
  end

  def test_customer_age
    assert_equal(26, @person1.age)
  end

  def test_drunk_level_sober
    assert_equal(0, @person1.drunk_level)
  end

  def test_drunk_level_tipsy
    @person1.increase_drunk_level(@drink2)
    assert_equal(1.5, @person1.drunk_level)
  end

  def test_drink_starts_empty
    assert_equal(0, @person1.drink_count)
  end

  def test_add_drink_to_customer
    @person1.add_drink(@drink2)
    assert_equal(1, @person1.drink_count)
  end

  def test_customer_spends_money
    @person1.pay_drink(@drink2)
    assert_equal(46, @person1.wallet)
  end

  def test_buy_drink
    @bar.service(@person1, @drink2, @room1)
    assert_equal(1, @person1.drink_count)
    assert_equal(46, @person1.wallet)
    assert_equal(2, @bar.stock_count)
    assert_equal(4, @room1.bill)
    assert_equal(1.5, @person1.drunk_level)
  end

  def test_remove_drink
    @bar.sell_drink(@drink3)
    assert_equal(2, @bar.stock_count)
  end


  def test_food_eat
    @bar.service(@person1, @drink3, @room1)
    @bar.service(@person1, @drink3, @room1)
    @person1.eat(@food)
    assert_equal(4.5, @person1.drunk_level)
  end

end
