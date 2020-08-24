require 'nokogiri'
require 'open-uri'
require 'json'
require 'httparty'
class EasyMeals::CLI 



  recipes_in_search = [];
  
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
   
             Hello its all Easy Meals Recipes CLI! In this CLI app, you will be able to search for recipes using a keyword such as 'chicken', 'beef' or whatever your heart  desire, then see a list of recipes on Easy Meals website. You can then request more details on the recipe! Lets make easy fun meals!
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
  print "Enter a keyword you would like to search for (eg. chicken, pork, or beef ): "
  @search_word = gets


  puts "Getting recipes for #{@search_word}"
  
  recipes_in_search = []
  recipes_in_search = EasyMeals::Scraper.search_url(@search_word)

  recipes_in_search.each do |recipe|
    recipe.display_self
  end
  
end

def goodbye

  puts "Thank you for using the Easy Meals CLI"

end

  def list_recipes
        recipes = EasyMeals::Recipe.all

        if recipes == []
            puts "There are currently no recipes to list. Please search a recipe first."
        else
            puts "------------------------------------------------------------------------------------------------------"
            recipes.each_with_index { |recipe, i|
                puts "#{i+1})   Name: #{recipe.name}"
            }
            puts "------------------------------------------------------------------------------------------------------"
        end
    end
    
  
   def clear_screen()

      i = 0
      while i < 0 do
        i = i+1
        puts("")  
      end

   end
  
  
  
  
   def menu
        clear_screen
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
                clear_screen
                puts "Search finished. Run list to see recipes"
            elsif input == "list"
                clear_screen
                list_recipes
            elsif input == "exit"
                goodbye
            elsif input.to_i > 0
                clear_screen
                if input.to_i <= EasyMeals::Recipe.all.size
                    recipe = EasyMeals::Recipe.all[input.to_i-1]
                    EasyMeals::Scraper.scrape_recipe(recipe) if !recipe.ingredients
                    recipe.display_self
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