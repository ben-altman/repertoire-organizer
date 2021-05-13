class CompositionsController < ApplicationController

    get '/compositions' do
#  binding.pry
        if !logged_in?
            redirect '/'
        end
        @user = current_user

        erb :'compositions/index'    
    end

    get '/compositions/new' do
        erb :'/compositions/new'
    end

    get 'compositions/:slug' do
        @composition = Composition.find_by_slug(params[:slug])
        erb :'compositions/show'
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

