require 'rspec'
require 'album'
require 'pry'

describe '#Album' do

  before(:each) do
    Album.clear()
  end

  describe('#save') do
    it("saves an album") do
      album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz", "1959")
      album.save()
      album2 = Album.new("Blue", nil, "rando", "Folk-Pop", "2003")
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz", "1959")
      album.save()
      album2 = Album.new("Blue", nil, "rando", "Folk-Pop", "2003")
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz", "1959")
      album2 = Album.new("Giant Steps", nil, "John Coltrane", "Jazz", "1959")
      expect(album).to(eq(album2))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz", "1959")
      album.save()
      album2 = Album.new("Blue", nil, "rando", "Folk-Pop", "2003")
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz", "1959")
      album.save()
      album.update("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz", "1959")
      album.save()
      album2 = Album.new("Blue", nil, "rando", "Folk-Pop", "2003")
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe('initialize') do
    it('') do
      album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz", "1959")
      album.save()
      expect(album.name).to(eq("Giant Steps"))
      expect(album.artist).to(eq("John Coltrane"))
      expect(album.genre).to(eq("Jazz"))
      expect(album.year).to(eq("1959"))
    end
  end

  describe('.search') do
    it('will search through all albums and return an album that has a matching name') do
      album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz", "1959")
      album.save()
      expect(Album.search("Giant Steps")).to(eq(album))
    end
  end
end

