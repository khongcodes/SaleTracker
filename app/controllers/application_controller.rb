require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    redirect '/users/dashboard' if logged_in?
    erb :welcome
  end

########################################################################
#################             REGISTRATION             #################
########################################################################

  get '/register' do
    redirect '/users/dashboard' if logged_in?
    erb :register
  end

  post '/register' do
    #must generate unique slug
    if User.all.any?{|a|a.slug == params[:username].gsub(" ","-").downcase}
      @error = "This username is already taken."
      erb :register

    #must have unique email
    elsif !!User.find_by(email:params[:email])
      @error = "This email is already taken."
      erb :register

    #must have password
    elsif params.any?{|key,value|value.empty?}
      @error = "All fields must be filled in."
      erb :register

    else
      User.create(username:params[:username], email:params[:email], password:params[:password])
      redirect '/'
    end
  end

########################################################################
#################                LOGIN                 #################
########################################################################

  get '/login' do
    redirect '/users/dashboard' if logged_in?
    erb :login
  end

  post '/login' do
    if params.any?{|key,value|value.empty?}
      @error = "All fields must be filled in."
      erb :login
    else
      user = User.find_by(username:params[:input]) || User.find_by(email:params[:input])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/users/dashboard'
      else
        @error = "Incorrect credentials."
        erb :login
      end
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


  

  helpers do
    def current_user
      @user = User.find_by(id:session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def logged_in_re?
      if !logged_in?
        redirect '/'
      else
        true
      end
    end
  end
end
