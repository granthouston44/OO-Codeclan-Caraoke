require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest')
require_relative('../room')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class TestGuest < MiniTest::Test

def setup
  @person1 = Guest.new("Grant", 50, "Shoot to thrill")
  @person2 = Guest.new("Ailsa", 50, "Ocean Avenue")

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
  @person1.spend_money(10)
  assert_equal(40, @person1.wallet)
end


end
