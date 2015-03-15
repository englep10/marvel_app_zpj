class MarvelController < ApplicationController

	def index
  		if params[:search]
    	search = params[:search].gsub(' ', '+')
      response = HTTParty.get("http://gateway.marvel.com/v1/public/characters?nameStartsWith=#{search}&ts=1&apikey=5e665d8cd10204f361468c880972d41b&hash=74d6bf483eaaa4692876c00eb0fa9e31")
    	results = JSON.parse(response.body)
    	@results = results['data']['results']
    
  		else
   		@results = []
  		end
	end

	def show
      @show_id = params['id'].to_i
      @name = params['name']
    
  		response = HTTParty.get("http://gateway.marvel.com/v1/public/characters/#{@show_id}&ts=1&apikey=5e665d8cd10204f361468c880972d41b&hash=74d6bf483eaaa4692876c00eb0fa9e31")
      result = JSON.parse(response.body)
      @result = result['results']
      binding.pry
	end

end