require 'nokogiri'
require 'open-uri'
require 'json'
require 'httparty'
class EasyMeals::Recipe
  #attr_accessor :name, :category , :url, :ingredients, :directions #:total_time

   attr_accessor :name, :url, :ingredients, :directions, :recipe
    @@all = []

    def initialize
      @name = name
      @url = url
      @recipe = recipe
      @ingredients = []
      @directions = []
      @@all << self
    end

    def self.new_from_tasty(recipe_hash) #url // recipe_hash
        recipe = self.new

        recipe_hash.each {|key, value| recipe.send("#{key}=", value)}
    end

    def self.all
        @@all
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