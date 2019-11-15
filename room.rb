class Room

attr_reader :room_num, :playlist, :guests, :entry_fee, :capacity, :guests
attr_accessor :bill

def initialize(room_num, playlist)
  @room_num = room_num
  @playlist = playlist
  @entry_fee = 10
  @capacity = 10
  @bill = 0
  @guests = []
end

def add_song(track)
  @playlist.push(track)
end



# def thats_a_tune(room)
#   @playlist.find {|playlist| playlist.title == room.playlist}
#
# end

end
