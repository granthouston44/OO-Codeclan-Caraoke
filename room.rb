require('pry')
class Room

  attr_reader :room_num, :playlist, :entry_fee, :capacity, :guests
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

  def guest_count
    @guests.size
  end

  def add_guest(person)
    @guests.push(person)
  end

  def remove_guest(person)
    @guests.delete(person)
  end

  def check_in(person)
    if guest_count >= capacity
      return p "Sorry, the room is full"
    else
      add_guest(person)
    end
  end

  def check_out(person)
    remove_guest(person)
  end
  # def thats_a_tune(room)
  #   @playlist.find {|playlist| playlist.title == room.playlist}
  #
  # end

end
