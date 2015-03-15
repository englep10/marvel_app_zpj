class MarvelController < ApplicationController

	def index
  		if params[:search]
    	search = params[:search].gsub(' ', '+')
    	response = HTTParty.get("http://gateway.marvel.com/v1/public/characters?apikey=5e665d8cd10204f361468c880972d41b")
    	results = JSON.parse(response.body)
    	@results = results['name']
  		else
   		@results = []
  		end
	end

	def show
  		response = HTTParty.get("http://gateway.marvel.com/v1/public/characters/#{params[:id]}")
  		@result = JSON.parse(response.body)
	end

end