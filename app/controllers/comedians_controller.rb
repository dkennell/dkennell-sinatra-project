class ComediansController < ApplicationController
    
    get '/comedians' do 
        erb :'comedians/index'
    end
    
    get '/comedians/signup' do 
      if session[:id] == nil
          erb :'/comedians/signup'
      else
          @comedian = Comedian.find(session[:id])
          redirect '/comedians/#{@comedian.slug}'
      end
    end
    
    post '/comedians/signup' do
        @comedian = Comedian.new(params)
        if @comedian.valid?
          @comedian.save
          session[:id] = @comedian.id
          session[:type] = "comedian"
          redirect "/comedians/#{@comedian.slug}"
        else
          @error_handling = true
          erb :'/comedians/signup'
        end
    end
       
     get '/comedians/login' do 
        erb :'/comedians/login'
    end
    
    post '/comedians/login' do
        @comedian = Comedian.find_by(params)
        session[:id] = @comedian.id
        session[:type] = "comedian"
        redirect "comedians/#{@comedian.slug}"
    end

    get '/comedians/:slug' do
          @comedian = Comedian.find_by_slug(params[:slug])
        if session[:id] == @comedian.id && session[:type] == "comedian"
            @own_page = true
        else
            @own_page = false
        end
        if session[:id] == nil
            redirect '/'
        else
            erb :'/comedians/show'
        end
    end
    
    get '/comedians/:slug/edit' do
       @comedian = Comedian.find(session[:id])
       erb :'/comedians/edit' 
    end
    
    patch '/comedians/:slug/edit' do 
        @comedian = Comedian.find(session[:id])
        @comedian.update(:username => params[:username], :password => params[:password], :name => params[:name], :bio => params[:bio])
        @comedian.cds << Cd.create(:name => params[:cd])
        @comedian.specials << Special.create(:name => params[:special])
        @comedian.save
        redirect "/comedians/#{@comedian.slug}"
    end
    


end