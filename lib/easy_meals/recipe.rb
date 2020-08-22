class EasyMeals::Recipe
  attr_accessor :name, :category , :url, :ingredients, :directions #:total_time
 
 def initialize(name, url, category)
    @name = name
    @url = url
    @category = category
    @ingredients = []
    @instructions = []
    self.class.all << self
  end

 
 
  
 def self.all 
   #i should return a bunch of instance of Recipe
    
   puts "TESTING CONNECTING PAGE"
 end
  
  
  
  
  
  
end