require 'nokogiri'
require 'open-uri'
require 'json'
require 'httparty'
class EasyMeals::CLI 
  
  def call
    quick_ideas
    menu
    happy_eating 
    recipes
    search
  end

  def quick_ideas
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
        puts " *Green Bean Casserole
               *Slow Cooker Mashed Potatoes
               *Apple Pie Bake
        
          Here is the TOP ideas for '5 Ingredinets Or Less'...type exit when done"
        
          
        when "2"
        puts  "Bacon-wrapped Brussels Sprouts
              Pull-Apart Garlic Rolls
              Pigs In A Blanket
        
            Here is the TOP ideas for '3 5-Ingredients Appetizers
            For Last-Minute'...'type exit when done'"
        when "3"
        puts "Honey-Roasted Carrots
              Butter Parmesan Corn
              Bacon And Onion Roasted Potatoes
 Here is the TOP ideas for '4 easy 3-Ingredient Vegetable Side Dishes'...type exit when done"
        else 
       puts "MORE TO COME type exit and ... HEAD OVER TO VIEW OUR MENU" 
        end
      end
  end
 
def happy_eating
   puts " Enjoy your MEAL!!!"
# @recipes = EasyMeals::Recipe.all
end

def search
  print "Enter a keyword you would like to search for (eg. chicken, stew, or beef burger): "
  @search_word = gets

  EasyMeals::Scraper.search_url(@search_word)
  puts "Getting recipes for #{@search_word}"
end

# def menu 
       
#   puts "Explore hundreds of top-rated quick and easy recipes for breakfast, lunch, and dinner."
  
#   #what my menu need to have (:name, :total_time, :url, :ingredients, :directions)
#   #more info --type the number of recipes you would like more info
#   puts <<-DOC
#             ____________________________________________________________________________________________________
#             MENU:
#             Type 'search' to use a search term to lookup recipes.
#             Tpye 'more info' 
#             Type 'list' to list recipes.
#             Type 'exit' to exit application.
#             ______________________________________________________________________________________________________
#             DOC
#           input = nil
#       while input != "exit"
#           input = gets.strip.downcase
#           if input == "search"
#                 "search1" #my returns (blank)
#           elsif input == "list"
#                 puts "list_recipes2"
#           elsif input == "more info"
#                 puts "still thinking "     
#           elsif input == "exit"
#                 puts "goodbye3"
#           elsif input.to_i > 0
#             else
#                 puts "Invalid command. Please type a valid command."
#             end
#           end
#   #create my if/else
  
  def list_recipes
        recipes = EasyMeals::Recipe.all

        if recipes == []
            puts "There are currently no recipes to list. Please search a recipe first."
        else
            puts "------------------------------------------------------------------------------------------------------"
            recipes.each.with_index(1) { |recipe, i|
                puts "#{i}. #{recipe.name} - #{recipe.total_time}"
            }
            puts "------------------------------------------------------------------------------------------------------"
        end
    end

    def display_recipe(recipe)
        puts "Name: #{recipe.name}"
        #puts "Total time: #{recipe.total_time}"

        puts ""

        puts "Ingredients:"
        recipe.ingredients.each.with_index(1) { |ingredient, i|
            puts "#{i}. #{ingredient}"
        }

        puts ""

        puts "Directions:"
        recipe.directions.each.with_index(1) { |direction, i|
            puts "#{i}. #{direction}"
            puts ""
        }
      #  @recipes = EasyMeals::Recipe.all
    end
  
  
  
  
  
  
  
  
   def menu
        input = nil

        while input != "exit"
            puts <<~DOC
            ------------------------------------------------------------------------------------------------------
            MENU:
            Type 'search' to use a search term to lookup recipes.
            Type the number of the recipe you would like more info on.
            Type 'list' to list recipes.
            Type 'exit' to exit application.
            ------------------------------------------------------------------------------------------------------
            DOC

            input = gets.strip.downcase

            if input == "search"
                search
            elsif input == "list"
                list_recipes
            elsif input == "exit"
                goodbye
            elsif input.to_i > 0
                if input.to_i <= EasyMeals::Recipe.all.size
                    recipe = EasyMeals::Recipe.all[input.to_i-1]
                    EasyMeals::Scraper.scrape_recipe(recipe) if !recipe.ingredients
                    display_recipe(recipe)
                else
                    puts "Invalid index."
                end
            else
                puts "Invalid command. Please type a valid command."
            end
        end
    end
  
  
  
  
  
  
  
  
  
  
  
  # def recipes
  #   puts " BIG TESTING"
  #   @recipes = EasyMeals::Recipe.all
  # end
   
  
end