class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self.all << self
  end

  def self.create
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song = Song.find_by_name(song_name)
    song ? song : Song.create_by_name(song_name)
  end

  def self.alphabetical
    x = self.all.sort! {|a,b| a.name<=>b.name}
  end

  def self.new_from_filename(song_name)
    song_list = song_name.scan(/(.+) - (.+).mp3/)
    song = Song.new_by_name(song_list[0][1])
    song.artist_name = song_list[0][0]
    song
  end

  def self.create_from_filename(song_name)
    song = self.new_from_filename(song_name)
    self.all << song
    song
  end
  def self.destroy_all
    self.all.clear
  end

end
