require('minitest/autorun')
require('minitest/reporters')
require_relative('../room')
require_relative('../guest')
require_relative('../songs')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class TestRoom < MiniTest::Test

  def setup

    @track1 = Song.new("Shoot to thrill", "AC/DC")
    @track2 = Song.new("Ocean Avenue", "Yellowcard")
    @track3 = Song.new("Feeling this", "blink-182")
    @track4 = Song.new("Filthy", "wstr")
    @track5 = Song.new("Party on Apocalypse", "New Found Glory")

    @track6 = Song.new("Bad Habit", "The Offspring")

    @playlist1 = [@track1, @track2, @track3]
    @playlist2 = [@track4, @track5]

    @person1 = Guest.new("Grant", 50, "Shoot to thrill")
    @person2 = Guest.new("Ailsa", 50, "Ocean Avenue")


    @room1 = Room.new(1, @playlist1)
    @room2 = Room.new(2, @playlist2)

  end

  def test_can_room_num
    assert_equal(2, @room2.room_num)
  end

  def test_can_get_playlist
    assert_equal([@track1, @track2, @track3], @room1.playlist)
  end

  def test_can_get_song_title
    assert_equal("Shoot to thrill", @track1.title)
  end

  def test_entry_fee
    assert_equal(10, @room2.entry_fee)
  end

  def test_capacity
    assert_equal(10, @room2.capacity)
  end

  def test_bill_starts_0
    assert_equal(0, @room1.bill)
  end

  def test_add_song_to_playlist
    @room2.add_song(@track6)
    assert_equal(3, @playlist2.size)
  end

  def test_guest_count_starts_0
    assert_equal(0, @room1.guest_count)
  end

  def test_check_in_guest
    @room1.add_guest(@person1)
    assert_equal(1, @room1.guest_count)
  end

  def test_check_out_guest
    @room1.add_guest(@person1)
    @room1.add_guest(@person2)
    @room1.remove_guest(@person1)
    binding.pry
    assert_equal(1, @room1.guest_count)
  end

  # def test_can_get_fav_song
  #     expected = @person1.thats_a_tune(@room1)
  #   assert_equal("YAAAASSSS", expected)
  # end

end
