class CompositionsController < ApplicationController

    get '/compositions' do
        if !logged_in?
            redirect '/'
        end
        @user = current_user

        erb :'compositions/index'    
    end

    get '/compositions/new' do
        if logged_in?
            erb :'/compositions/new'
        else
            redirect '/'
        end
    end

    get '/compositions/:slug' do
        if logged_in?
            @user = User.find(session[:user_id])
            @composition = Composition.find_by_slug(params[:slug])
            erb :'compositions/show'
        else
            redirect '/'
        end
    end

    post '/compositions/index' do

        if logged_in?
            @composition = Composition.create(params[:list][:composition])
            if current_user.list_types.any? {|l| l.name == params[:list][:name]}
                list = current_user.list_types.where(name: params[:list][:name])
                @composition.list_type_id = list.first.id
            else 
                @list = ListType.create(params[:list].except("composition"))
                @list.save
                current_user.list_types << @list
                @composition.list_type_id = @list.id
            end
            @composition.save
            redirect "/compositions"
        else
            redirect '/'
        end
    end

    get '/compositions/:slug/edit' do
        if logged_in?
            @composition = Composition.find_by_slug(params[:slug])
            erb :'compositions/edit'
        else
            redirect '/'
        end
    end

    patch '/compositions/:slug' do
        if logged_in?
            @composition = Composition.find_by_slug(params[:slug])
            @composition.title = params[:list][:composition][:title]
            @composition.era_id = params[:list][:composition][:era_id]
            if current_user.list_types.any? {|l| l.name == params[:list][:name]}
                list = current_user.list_types.where(name: params[:list][:name])
                @composition.list_type_id = list.first.id
            else 
                @list = ListType.create(params[:list].except("composition"))
                @list.save
                current_user.list_types << @list
                @composition.list_type_id = @list.id
            end
            @composition.save
            redirect "/compositions/#{@composition.slug}"
        else
            redirect '/'
        end
    end

    delete '/compositions/:slug/delete' do
        if logged_in?
            @composition = Composition.find_by_slug(params[:slug])            
            if @composition && @composition.list_type.user == current_user
                @composition.delete
            end
            redirect '/compositions'
        else
            redirect '/'
        end
    end

end

