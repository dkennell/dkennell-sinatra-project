class CdsController < ApplicationController
    
    get '/cds' do 
        erb :'/cds/index'
    end
    
    get '/cds/:slug' do 
        @cd = Cd.find_by_slug(params[:slug])
        erb :'/cds/show'
    end
    
    get '/cds/:slug/delete' do
        @comedian = Comedian.find(session[:id])
        @cd = Cd.find_by_slug(params[:slug])
        @cd.delete
        redirect "/comedians/#{@comedian.slug}"
    end
    
end