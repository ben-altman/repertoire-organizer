class UsersController < ApplicationController

    
    get "/users/:slug" do
        @user = User.find_by_slug(params[:slug])
        if logged_in?
            erb :"users/show"
        else
            redirect "/login"
        end
    end
    
    get '/login' do
        "hello"    
    end

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.new(params)
        if  @user.save
            @user.save
            session[:user_id] = @user.id
            redirect to ("users/#{@user.slug}")
        else
            
            params[:username] == "" || params[:password] == ""
            redirect '/signup'
        end
    end

    
end
