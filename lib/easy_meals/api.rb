require 'open-uri'
require 'json'
require 'httparty'


class EasyMeals::ApiFetcher

    attr_accessor :url
    def initialize(url)

      @url = url;
      return self
    end



    def create_recipes_from_json


      # Get data from API
      response = HTTParty.get(@url)

      # Make data into an object we can use
      recipes = JSON.parse(response.parsed_response, object_class: OpenStruct)

      # go through recipes in data
      recipes["recipes"].each do |recipe|
        new_recipe_instance = EasyMeals::Recipe.new(recipe.name,recipe.url,recipe.recipe,recipe.ingredients,recipe.directions,recipe.total_time)
        
      end


    end
 
 

end
  