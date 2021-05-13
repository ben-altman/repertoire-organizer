class CompositionsController < ApplicationController

    get '/compositions' do
binding.pry
        erb :'compositions/index'    
    end

    get '/compositions/new' do
        erb :'/compositions/new'
    end

    post '/compositions/index' do

        @composition = Composition.create(params[:list][:composition])

        if current_user.list_types.any? {|l| l.name == params[:list][:name]}
            list = current_user.list_types.where(name: params[:list][:name])
            @composition.list_type_id = list.first.id
        else 
            @list = ListType.create(params[:list][:name])
            current_user.list_types << @list
            @composition.list_type_id = @list.id
        end

        @composition.save

        redirect "/compositions"
    end
end

    # @song = Song.create(params[:song])
    # @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    # @song.genre_ids = params[:genres]
    # @song.save

    # flash[:message] = "Successfully created song."
    # redirect("/songs/#{@song.slug}")