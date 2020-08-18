class EasyMeals::CLI 
  
  def call
    puts "Welcome !!!
    Easy Fun Fast Meals"
    categories_list
    #menus
    
  end

def categories_list
   puts <<-DOC
   Hello its all Tasty Recipes CLI! In this CLI app, you will be able to search for recipes using a keyword such as 'chicken', 'beef' or whatever your heart desires**, then see a list of recipes on Tasty.co  website. You can then request more details on the recipe! Lets make easy fun meals!
   _______________________________________________________________
   
   1. 5 Ingredients Or Less
   2. Three Five-Ingredient Appetizers For Last-Minute 
   3. 4 easy 3-Ingredient Vegetable Side Dishes
 DOC
end

def menu
  puts "Enter the number of the "
  
end



end