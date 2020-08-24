require 'nokogiri'
require 'open-uri'
require 'json'
require 'httparty'
class EasyMeals::Recipe
  #attr_accessor :name, :category , :url, :ingredients, :directions 

   attr_accessor :name, :url, :ingredients, :directions, :recipe 
    @@all = []

    def initialize(name,url,recipe,ingredients,directions)
      @name = name
      @url = url
      @recipe = recipe
      @ingredients = ingredients
      @directions = directions
      @@all << self
    end


    #Class Methods

    def self.new_from_tasty(recipe_hash) #url // recipe_hash
        recipe = self.new

        recipe_hash.each {|key, value| recipe.send("#{key}=", value)}
    end

    def self.all
        @@all
    end




    # Instance methods.



    
    def display_self()
        puts "Name: #{@name}"
        

        puts ""

        puts "Ingredients:"
        @ingredients.each_with_index { |ingredient, i|
            puts "#{i+1}. #{ingredient}"
        }

        puts ""

        puts "Directions:"
        @directions.each_with_index { |direction, i|
            puts "#{i+1}. #{direction}"
            puts ""
        }
    end

 
  
# def self.all 
#   #i should return a bunch of instance of Recipe
#     @@all
#   puts "TESTING CONNECTING PAGE"
# end
  
# def self.new_from_tasty(url) 
#   puts "new self to see working"
# end 
  
  
end