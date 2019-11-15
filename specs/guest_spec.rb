require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class TestGuest < MiniTest::Test

def setup
  @person1 = Guest.new("Grant", 50, "Shoot to thrill")
  @person2 = Guest.new("Ailsa", 50, "Ocean Avenue")
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

end
