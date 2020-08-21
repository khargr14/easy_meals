class EasyMeals::CLI 
  
  def call
    categories_list
    #menu
    happy_eating 
  end

def categories_list
    puts <<-DOC
      "Welcome !!!
        Easy Fun Fast Meals"
   
             Hello its all Tasty Recipes CLI! In this CLI app, you will be able to search for recipes using a keyword such as 'chicken', 'beef' or whatever your heart  desire, then see a list of recipes on Tasty.co  website. You can then request more details on the recipe! Lets make easy fun meals!
   _______________________________________________________________
 Quick ideas  
 
   1. 5 Ingredients Or Less
   2. 3 Five-Ingredient Appetizers For Last-Minute 
   3. 4 easy 3-Ingredient Vegetable Side Dishes
 DOC

 
    puts "Enter the number for quick ideas or type exit when done "
  
      input = nil
        while input != "exit"
      input = gets.strip.downcase
        case input
        when "1"
        puts "Here is the TOP ideas for '5 Ingredinets Or Less'..."
        when "2"
        puts "Here is the TOP ideas for '3 5-Ingredients Appetizers For Last-Minute'..."
        when "3"
        puts "Here is the TOP ideas for '4 easy 3-Ingredient Vegetable Side Dishes'..."
        else 
        puts "more to come..." 
        end

  end
 
def happy_eating
   puts " Enjoy your MEAL!!!"
 #@recipes = EasyMeals::Recipe.all
end



#def menu 
  
  #put "tesing"
  #what my menu need to have (:name, :total_time, :url, :ingredients, :directions)
  #puts <<-DOC
            #------------------------------------------------------------------------------------------------------
           # MENU:
           # Type 'search' to use a search term to lookup recipes.
           # Type the number of the recipe you would like more info on.
           # Type 'list' to list recipes.
           # Type 'exit' to exit application.
           # ------------------------------------------------------------------------------------------------------
           # DOC
   #create my if/else
 end
