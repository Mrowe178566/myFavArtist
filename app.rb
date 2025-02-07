require "sinatra"
require 'dotenv/load'
require 'rspotify'

RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])

get '/' do
  erb :form
end

post '/results' do
  artist_name = params[:artist_name]
  @artists = RSpotify::Artist.search(artist_name)
  erb :results
end
