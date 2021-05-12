class CompositionsController < ApplicationController

    get '/compositions/new' do
        erb :'/compositions/new'
    end

    post '/compositions/index' do

 binding.pry
    end
end

    # @song = Song.create(params[:song])
    # @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    # @song.genre_ids = params[:genres]
    # @song.save

    # flash[:message] = "Successfully created song."
    # redirect("/songs/#{@song.slug}")