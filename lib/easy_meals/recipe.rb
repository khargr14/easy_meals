require 'open-uri'
require 'json'
require 'httparty'

class EasyMeals::Recipe
  #attr_accessor :name, :category , :url, :ingredients, :directions #:total_time

   attr_accessor :name, :url, :ingredients, :directions, :recipe, :total_time
    @@all = []

    def initialize(name,url,recipe,ingredients,directions,total_time)
      @name = name
      @url = url
      @recipe = recipe
      @ingredients = ingredients
      @directions = directions
      @total_time = total_time
      @@all << self
    end


    #Class Method

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

 
  
end