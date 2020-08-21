class EasyMeals::CLI 
  
  def call
    categories_list
    menu
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
        puts "Here is the TOP ideas for '5 Ingredinets Or Less'...type exit when done"
        when "2"
        puts "Here is the TOP ideas for '3 5-Ingredients Appetizers For Last-Minute'...'type exit when done'"
        when "3"
        puts "Here is the TOP ideas for '4 easy 3-Ingredient Vegetable Side Dishes'...type exit when done"
        else 
       puts " MORE TO COME ...  HEAD OVER TO VIEW OUR MENU" 
        end
      end
  end
 
def happy_eating
   puts " Enjoy your MEAL!!!"
 
end



def menu 
       
  puts "Explore hundreds of top-rated quick and easy recipes for breakfast, lunch, and dinner."
  
  #what my menu need to have (:name, :total_time, :url, :ingredients, :directions)
  #more info --type the number of recipes you would like more info
  puts <<-DOC
            ____________________________________________________________________________________________________
            MENU:
            Type 'search' to use a search term to lookup recipes.
            Tpye 'more info' 
            Type 'list' to list recipes.
            Type 'exit' to exit application.
            ______________________________________________________________________________________________________
             DOC
           input = nil
      while input != "exit"
          input = gets.strip.downcase
          if input == "search"
                puts "search1"
                
            elsif input == "list"
                 puts "list_recipes2"
            elsif input == "exit"
                puts "goodbye3"
            elsif input.to_i > 0
             else
                puts "Invalid command. Please type a valid command."
             end
           end
  #create my if/else
  
  def goodbye
     puts " BIG TESTING"
    #@recipes = EasyMeals::Recipe.all
  end
   
  end
end