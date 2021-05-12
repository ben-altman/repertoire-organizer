require 'rack-flash'

class UsersController < ApplicationController
    use Rack::Flash
    
    get "/users/:slug" do
        @user = User.find_by_slug(params[:slug])
        if logged_in?
            erb :"users/show"
        else
            redirect "/login"
        end
    end
    
    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(:name => params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "users/#{user.slug}"
        else 
            flash[:error] = "Please enter a valid username and password"
            redirect "users/login"
        end
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

    get '/logout' do
        session.destroy
        redirect '/'
    end

    
end
