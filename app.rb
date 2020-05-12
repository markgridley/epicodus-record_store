require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @albums = Album.sort
  erb(:albums) #erb file name
end

get('/albums') do
  @albums = Album.sort
  erb(:albums)
end

get('/albums/new') do
  erb(:new_album)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/albums/search') do
  @album = Album.search(params[:name])
  erb(:search)
end

post('/albums') do ## Adds album to list of albums, cannot access in URL bar
  name = params[:album_name]
  artist = params[:album_artist]
  year = params[:album_year]
  genre = params[:album_genre]
  album = Album.new(name, nil, artist, genre, year)
  album.save()
  @albums = Album.all()
  erb(:albums)
end

# get('/albums/:id/buy') do
#   @album = Album.find(params[:id].to_i())
#   erb(:buy_album)
# end

# patch('albums/:id') do 
#   @album = Album.find(params[:id].to_i())
#   @album.sold()
#   @albums = Album.all_sold
#   erb(:albums)
# end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name])
  @albums = Album.all
  erb(:albums)
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)
end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end

## implement sold() method on album.erb
## implement sort method on albums.erb
## implement search method on albums.erb