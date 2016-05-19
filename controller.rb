require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pry-byebug'
require_relative('./models/artist')

get '/artists/new' do
  erb(:'artists/new')
end

get '/artists' do
  @artists = Artist.all()
  erb(:'artists/index')
end

post '/artists' do
  @artist = Artist.new(params)
  @artist.save()
  erb(:'artists/create')
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb(:'artists/show')
end

get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb(:edit)
end

