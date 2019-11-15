require('minitest/autorun')
require('minitest/reporters')
require_relative('../room')

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
@playlist2 = [@track4, @track5, @track6]

@person1 = Guest.new("Grant", 50, "Shoot to thrill")
@person2 = Guest.new("Ailsa", 50, "Ocean Avenue")


@room1 = Room.new(1, [@playlist1])
@room2 = Room.new(2, [@playlist2])

end

end
