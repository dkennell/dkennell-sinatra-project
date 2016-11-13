class FansController < ApplicationController
    
    get '/fans' do
        if session[:id] == nil
            redirect '/'
        end
        erb :'/fans/index'
    end
    
    get '/fans/signup' do 
      if session[:id] == nil
          erb:'/fans/signup'
      else
          @fan = Fan.find(params[:id])
          redirect "/fans/#{@fan.slug}"
      end
    end
    
    post '/fans/signup' do
        @fan = Fan.new(params)
        if @fan.valid?
          @fan.save
          session[:id] = @fan.id
          session[:type] = "fan"
          redirect "/fans/#{@fan.slug}"
        else
          @error_handling = true
          erb :'/fans/signup'
        end
    end
    
    get '/fans/login' do 
      if session[:id] == nil
          erb:'/fans/login'
      else
          @fan = Fan.find(params[:id])
          redirect "/fans/#{@fan.slug}"
      end
    end
    
    post '/fans/login' do 
        @fan = Fan.find_by(:username => params[:username], :password => params[:password])
        if @fan == nil
            @failed_login = true
            erb :'/fans/login'
        else
          session[:id] = @fan.id
          session[:type] = "fan"
          if session[:id] == @fan.id
            @own_page = true
          else
            @own_page = false
          end
        redirect "/fans/#{@fan.slug}"
        end
    end
    
    post '/fans/become_fan' do
        @fan = Fan.find(session[:id])
        @comedian = Comedian.find(params[:comedian_id])
        if !@fan.comedians.include?(@comedian)
          @comedian.fans << @fan
        end
        redirect "/comedians/#{@comedian.slug}"
    end
    
    post '/fans/withdraw_fanhood' do 
        @fan = Fan.find(session[:id])
        @comedian = Comedian.find(params[:comedian_id])
        @fan.comedians.delete(Comedian.find(@comedian.id))
        @comedian.fans.delete(Fan.find(@fan.id))
        redirect "comedians/#{@comedian.slug}"
    end
    
    get '/fans/:slug' do
        if session[:id] == nil
            redirect '/'
        end
        @fan = Fan.find_by_slug(params[:slug])
        if session[:id] == @fan.id
            @own_page = true
        else
            @own_page = false
        end
        
        erb :"fans/show"
    end
    
    
end