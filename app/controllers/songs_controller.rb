require 'rack-flash'
class SongsController < ApplicationController
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @artist = @song.artist
        @song_genre = SongGenre.all.select{|song|song.song_id == @song.id}[0]
        @genre = Genre.find_by_id(@song_genre.genre_id)
        erb :'/songs/show'
    end
    #NEW SONG
    # get '/songs/new' do
    # end

    # post '/songs' do
    # end


    get '/songs/:id' do
        @song = Song.find_by(params[:id])
        erb :show
    end



end