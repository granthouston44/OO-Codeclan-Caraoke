class Song


#allow the name and artist parameters to be read by other classes
#setup as getters
attr_reader :title, :artist

#initialized the object so that it takes two parameters
  def initialize(title, artist)
    @title = title
    @artist = artist
  end


end
