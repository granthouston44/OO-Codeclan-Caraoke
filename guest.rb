class Guest

attr_reader :name, :wallet, :fav_song

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

def spend_money(amount)
  @wallet -= amount
end

def pay_entry(room)
  spend_money(room.entry_fee)
  room.bill += room.entry_fee
end

end
