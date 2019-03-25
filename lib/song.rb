class Song
  attr_accessor :name, :artist
  @@songs = []
  def initialize(name)
    @name = name
  end
  def self.new_by_filename(filename)
    artist_name,title,genre = filename.split(" - ")
    song = Song.new(title)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.artist.add_song(self)
    @@songs << song
    song
  end
end
