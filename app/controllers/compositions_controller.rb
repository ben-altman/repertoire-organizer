class CompositionsController < ApplicationController

    get '/compositions/new' do
        erb :'/compositions/new'
    end
end