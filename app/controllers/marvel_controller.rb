class MarvelController < ApplicationController

	def index
  		if params[:search]
    	search = params[:search].gsub(' ', '+')
      response = HTTParty.get("http://gateway.marvel.com/v1/public/characters?name=#{search}&ts=1&apikey=5e665d8cd10204f361468c880972d41b&hash=74d6bf483eaaa4692876c00eb0fa9e31")
    	results = JSON.parse(response.body)
    	@results = results['data']['results']
  		else
   		@results = []
  		end
	end

	def show
  		response = HTTParty.get("http://gateway.marvel.com/v1/public/comics/characters/#{params[:id]}")
  		@result = JSON.parse(response.body)

	end

end