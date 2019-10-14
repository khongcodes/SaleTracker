class UsersController < ApplicationController

    get '/users/dashboard' do
        current_user
        erb :'/users/dashboard'
    end

########################################################################
#################              SHOW ACTION             #################
########################################################################
    
    get '/users' do
        @users = User.all
        erb :'/users/index'
    end
    
    get '/users/:id' do
        @user = User.find_by(id:params[:id])
        erb :'/users/show'
    end

########################################################################
#################            SHOW ITEMS SOLD           #################
########################################################################

    get '/users/:id/sold' do
        @user = User.find_by(id:params[:id])
        if session[:user_id]!=@user.id
            @error = "You don't have permission to view this page."
            erb :'/users/show'
        else
            @items = @user.items
            erb :'/users/items_sold'
        end
    end

########################################################################
#################              EDIT ACTION             #################
########################################################################

    get '/users/:id/edit' do
        @user = User.find_by(id:params[:id])

        if session[:user_id] != params[:id].to_i
            @error = "You don't have permission to make changes."
            erb :'/users/show'
        else
            erb :'/users/edit'
        end
    end 

    patch '/users/:id' do
        @user = User.find_by(id:params[:id])
        
        #authenticate w current password
        if !@user.authenticate(params[:password0])
            @error = "Incorrect password."
            erb :'/users/edit'

        else
            @user.username = params[:username]
            @user.email = params[:email]
            @user.password = params[:password] unless params[:password].empty?
            @user.save
            redirect "/users/#{@user.id}"
        end
    end

########################################################################
#################             DESTROY ACTION           #################
########################################################################

    delete '/users/:id' do
        @user = User.find_by(id:params[:id])
        #authenticate w current password
        if !@user.authenticate(params[:password0])
            @error = "Incorrect password."
            erb :'/users/edit'
        else
            @user = User.find_by(id:params[:id])
            @user.delete
            redirect '/'
        end
    end

end