class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|i| i.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    here_it_is = self.find_by_name(song_name)
    if here_it_is == nil
      self.create_by_name(song_name)
    else
      here_it_is
    end
  end

  def self.alphabetical
    self.all.sort_by {|i| i.name}
  end

  def self.new_from_filename(mp3_file)
    m = self.new
    m.name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    m.artist_name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    m
  end

  def self.create_from_filename(mp3_file)
    m = self.new
    m.name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[1]
    m.artist_name = mp3_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    m.save
    m
  end

  def self.destroy_all
    self.all.clear
  end

end
