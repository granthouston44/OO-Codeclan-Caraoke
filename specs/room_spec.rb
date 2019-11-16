require('minitest/autorun')
require('minitest/reporters')
require_relative('../room')
require_relative('../guest')
require_relative('../songs')
require_relative('../drink')
require_relative('../bar')
require_relative('../food')



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

    @person1 = Guest.new("Grant", 50, "Shoot to thrill", 18)
    @person2 = Guest.new("Ailsa", 50, "Ocean Avenue", 18)
    @person3 = Guest.new("Alan", 50, "Whole lotta Rosie", 18)
    @person4 = Guest.new("Chris", 50, "Beelzeboss", 18)
    @person5 = Guest.new("Cammy", 50, "Baggy Trousers", 18)
    @person6 = Guest.new("Scott", 50, "Feeling This", 18)
    @person7 = Guest.new("Steph", 50, "Rollercoaster", 18)
    @person8 = Guest.new("Alex", 50, "If your dad doesn't have a beard, you've got 2 mums", 18)
    @person9 = Guest.new("Jack", 50, "Got me a beard", 18)
    @person10 = Guest.new("Yasmin", 50, "Save it for the bedroom", 18)
    @person11 = Guest.new("Caithlyn", 50, "One Love", 18)

    @drink1 = Drink.new("Tennets", 3, 1)
    @drink2 = Drink.new("Strongbow", 4, 1.5)
    @drink3 = Drink.new("Buckie", 6, 4)
    @drinks = [@drink1, @drink2, @drink3]

    @bar = BarTab.new(@drinks)

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

  def test_person_count_starts_0
    assert_equal(0, @room1.guest_count)
  end

  def test_add_person
    @room1.add_guest(@person1)
    assert_equal(1, @room1.guest_count)
  end

  def test_remove_person
    @room1.add_guest(@person1)
    @room1.add_guest(@person2)
    @room1.remove_guest(@person1)
    assert_equal(1, @room1.guest_count)
  end

  def test_check_room_capacity
    @room1.check_in(@person1)
    @room1.check_in(@person2)
    @room1.check_in(@person3)
    @room1.check_in(@person4)
    @room1.check_in(@person5)
    @room1.check_in(@person6)
    @room1.check_in(@person7)
    @room1.check_in(@person8)
    @room1.check_in(@person9)
    @room1.check_in(@person10)
    expected = @room1.check_in(@person11)
    assert_equal(10, @room1.guest_count)
    assert_equal("Sorry, the room is full", expected)
  end

  def test_check_out
    @room1.check_in(@person1)
    @room1.check_in(@person2)
    @room1.check_in(@person3)
    @room1.check_in(@person4)
    @room1.check_in(@person5)
    @room1.check_in(@person6)
    @room1.check_in(@person7)
    @room1.check_in(@person8)
    @room1.check_in(@person9)
    @room1.check_in(@person10)
    @room1.check_out(@person1)
    @room1.check_in(@person11)
    assert_equal(10, @room1.guest_count)
    assert_equal([@person2,@person3,@person4,@person5,@person6,@person7,@person8,@person9,@person10,@person11], @room1.guests)
  end

  def test_pay_entry
    @room1.pay_entry(@person1)
    assert_equal(40, @person1.wallet)
    assert_equal(10, @room1.bill)
  end

  def test_pay_entry_when_checking_in
    @room1.check_in(@person1)
    assert_equal(1, @room1.guest_count)
    assert_equal(40, @person1.wallet)
    assert_equal(10, @room1.bill)
  end

  def test_can_get_fav_song
    expected = @room1.thats_a_tune(@person2)
    assert_equal("YAAAASSSS", expected)
  end

  def test_dont_have_fav_song
    expected = @room1.thats_a_tune(@person3)
    assert_equal("Sorry don't have that song", expected)
  end

  def test_chuck_customer_out_if_too_drunk
    @room1.check_in(@person1)
    @room1.check_in(@person2)
    @bar.service(@person1, @drink3, @room1)
    @bar.service(@person1, @drink3, @room1)
    @bar.service(@person1, @drink3, @room1)
    @bar.service(@person1, @drink3, @room1)
    assert_equal(3, @person1.drink_count)
    assert_equal(22, @person1.wallet)
    assert_equal(2, @bar.stock_count)
    assert_equal(38, @room1.bill)
    assert_equal(12, @person1.drunk_level)
    assert_equal(1, @room1.guest_count)
  end







end
