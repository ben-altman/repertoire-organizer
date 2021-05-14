class ListTypesController < ApplicationController

    get '/list_types/:slug' do

        if logged_in?
            @user = User.find(session[:user_id])
            @list = ListType.find_by_slug(params[:slug])
            @compositions = @user.compositions.where(list_type_id: @list.id)
            erb :'list_types/show'
        else
            redirect '/'
        end
    end
end