class EasyMeals::CLI 
  
  def call
    puts "Welcome Easy Fun Fast Meals"
    menus
  end

def menus
   puts <<-DOC
   1. Holiday Sides Made With 5 Ingredients Or Less
   2.Three Five-Ingredient Appetizers For Last-Minute Holiday Parties
   3. 4 easy 3-Ingredient Vegetable Side Dishes
 DOC
end

end