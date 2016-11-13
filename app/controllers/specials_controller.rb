class SpecialsController < ApplicationController
    
    get '/specials' do 
        erb :'/specials/index'
    end
    
    get '/specials/:slug' do 
        @special = Special.find_by_slug(params[:slug])
        erb :'/specials/show'
    end
    
    get '/specials/:slug/delete' do
        @comedian = Comedian.find(session[:id])
        @special = Special.find_by_slug(params[:slug])
        @special.delete
        redirect "/comedians/#{@comedian.slug}"
    end
    
    
end