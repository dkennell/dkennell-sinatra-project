require './config/environment'

class ApplicationController < Sinatra::Base 
  
  configure do 
    enable :sessions
    set :session_secret, "secret"
    set :views, 'app/views'
  end

  get '/' do 
      if session[:id] != nil
        if session[:type] == "comedian"
          @comedian = Comedian.find(session[:id])
          redirect "/comedians/#{@comedian.slug}"
        elsif session[:type] == "fan"
          @fan = Fan.find(session[:id])
          redirect "/fans/#{@fan.slug}"
        else
          erb :'index'
        end
      else
      erb :'index'
      end
    end
  get '/logout' do 
    session.clear
    redirect '/'
  end

end