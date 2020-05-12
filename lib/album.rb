class Album

  attr_reader :id #Our new save method will need reader methods.
  attr_accessor :name, :artist, :genre, :year
  @@albums = {}
  @@total_rows = 0 # We've added a class variable to keep track of total rows and increment the value when an ALbum is added.

  def initialize(name, id, artist, genre, year)
    @name = name
    @id = id || @@total_rows += 1  # We've added code to handle the id.
    @artist = artist 
    @genre = genre 
    @year = year
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.artist, self.genre, self.year)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
    self.artist() == album_to_compare.artist()
    self.genre() == album_to_compare.genre()
    self.year() == album_to_compare.year()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name)
    self.name = name
    @@albums[self.id] = Album.new(self.name, self.id, self.artist, self.genre, self.year)
  end

  def delete()
    @@albums.delete(self.id)
  end
end