require 'pry'

class Album

  attr_reader :id 
  attr_accessor :name, :artist, :genre, :year
  @@albums = {}
  @@total_rows = 0 
  @@sold_albums = {}

  def initialize(name, id, artist, genre, year)
    @name = name
    @id = id || @@total_rows += 1 
    @artist = artist 
    @genre = genre 
    @year = year
  end

  def self.all
    @@albums.values()
  end

  def self.all_sold
    @@sold_albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.artist, self.genre, self.year)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
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

  def self.search(name)
    album_names = Album.all.map {|a| a.name }
    result = []
    names = album_names.grep(/#{name}/)
    names.each do |n| 
      display_albums = Album.all.select {|a| a.name == n}
      result.push(display_albums)
    end
    result
  end

  def self.sort()
    record_list = @@albums.values
    sorted_records = record_list.sort_by{ |record| record.name }
    sorted_records
  end
 
  def sold()
    @@sold_albums[self.id] = Album.new(self.name, self.id, self.artist, self.genre, self.year)
    @@albums.delete(self.id)
  end

  def songs
    Song.find_by_album(self.id)
  end
end

