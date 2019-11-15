#require in minitest and reporters module
#reporters module will aide in readability of the testing output
require('minitest/autorun')
require('minitest/reporters')

#require related files so that the test knows where to get code
require_relative('../songs')

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

class TestSong < MiniTest::Test

#create a new instance of song class and use it as a template for the rest of testing
def setup
@track1 = Song.new("Shoot to thrill", "AC/DC")
end


def test_get_song_name
  assert_equal("Shoot to thrill", @track1.title)
end

def test_get_song_artist
  assert_equal("AC/DC", @track1.artist)
end

end
