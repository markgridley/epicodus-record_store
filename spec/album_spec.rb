require 'rspec'
require 'album'
require 'song'
require('spec_helper')
# require 'pry'

describe '#Album' do

  describe('#save') do
    it("saves an album") do
      album = Album.new({:name => "Giant Steps", :id => nil})
      album.save()
      album2 = Album.new({:name => "Blue", :id => nil})
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
      album = Album.new({:name => "Giant Steps", :id => nil})
      album.save()
      album2 = Album.new({:name => "Blue", :id => nil})
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new({:name => "Giant Steps", :id => nil})
      album2 = Album.new({:name => "Giant Steps", :id => nil})
      expect(album).to(eq(album2))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new({:name => "Giant Steps", :id => nil})
      album.save()
      album2 = Album.new({:name => "Blue", :id => nil})
      album2.save()
      expect(Album.find(album.id)).to(eq(nil))
    end
  end
  
  describe('#update') do
    it("updates an album by id") do
      album = Album.new({:name => "Giant Steps", :id => nil})
      album.save()
      album.update("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new({:name => "Giant Steps", :id => nil})
      album.save()
      album2 = Album.new({:name => "Blue", :id => nil})
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end

    it("deletes all songs belonging to a deleted album") do
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      song = Song.new({:name => "Naima", :album_id => album_id, :id => nil})
      song.save()
      album.delete()
      expect(Song.find(song.id)).to(eq(nil))
    end
  end

  describe('initialize') do
    it('') do
      album = Album.new({:name => "Giant Steps", :id => nil})
      album.save()
      expect(album.name).to(eq("Giant Steps"))
    end
  end

  describe('.search') do
    it('will search through all albums and return all albums that contain a matching name') do
      album = Album.new({:name => "Giant Steps", :id => nil})
      album.save()
      album1 = Album.new({:name => "Little Giant", :id => nil})
      album1.save()
      expect(Album.search("Giant")).to(eq([[album], [album1]]))
    end
  end
  
  # describe('.sort') do
  #   it('will sort all albums alphabetically') do
  #     album = Album.new({:name => "Giant Steps", :id => nil})
  #     album.save()
  #     album2 = Album.new({:name => "A Big", :id => nil})
  #     album2.save()
  #     album1 = Album.new({:name => "Little Giant", :id => nil})
  #     album1.save()
  #     expect(Album.sort()).to(eq([album2, album, album1]))
  #   end
  # end

  
  describe('#songs') do
    it("returns an album's songs") do
      album = Album.new({:name => "Giant Steps", :id => nil})
      album.save()
      song = Song.new({:name => "Naima", :album_id => album_id, :id => nil})
      song.save()
      song2 = Song.new({:name => "California", :album_id => album_id, :id => nil})
      song2.save()
      expect(album.songs).to(eq([song, song2]))
    end
  end
  
  # describe('#sold') do
  #   it('will remove album from Album.all & put into @@sold_albums ') do
  #     album = Album.new({:name => "Giant Steps", :id => nil})
  #     album.save()
  #     album2 = Album.new({:name => "A Big", :id => nil})
  #     album2.save()
  #     album1 = Album.new({:name => "Little Giant", :id => nil})
  #     album1.save()
  #     album2.sold()
  #     expect(Album.all_sold).to(eq([album2]))
  #     expect(Album.all).to(eq([album, album1]))
  #   end
  # end
end