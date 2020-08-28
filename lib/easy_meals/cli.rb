require 'open-uri'
require 'json'
require 'httparty'

class EasyMeals::CLI 

  

  def call

    apifetcher = EasyMeals::ApiFetcher.new("https://raw.githubusercontent.com/peterlubiana/ruby-recipes/master/recipe.json")
    apifetcher.create_recipes_from_json
    greetings
    menu
  end



  def greetings
    puts <<-DOC
      "Welcome !!!
        Easy Fun Fast Meals"
   
             Hello its all Easy Meals Recipes CLI! In this CLI app, you will be able to search for recipes using a keyword such as 'chicken', 'beef' or whatever your heart  desire, then see a list of recipes on all recipes website. You can then request more details on the recipe! Lets make easy fun meals!
   _______________________________________________________________
 
 DOC

  end
 
def happy_eating
   puts " Enjoy your MEAL!!!"
# @recipes = EasyMeals::Recipe.all
end

def search
   print "Enter a keyword you would like to search for (eg. chicken, beef, or pork): "
   search_word = gets.strip.downcase

  all_recipes = EasyMeals::Recipe.all

  puts "search results for search: " + search_word
  all_recipes.each_with_index do |recipe, indx|
    if recipe.name.downcase[search_word]
       puts "#{indx+1}) " + recipe.name 
    end
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
                puts "#{i+1})   Name: #{recipe.name}    Total time - #{recipe.total_time}"
            }
            puts "------------------------------------------------------------------------------------------------------"
        end
    end
    
 
  
  
   def menu
       
        input = nil

        while input != "exit"
            puts <<~DOC
            ------------------------------------------------------------------------------------------------------
            MENU:
            Type 'search' to use a search term to lookup recipes.
            Type 'list' to list recipes.
            Type the number of the recipe you would like more info on.
            Type 'exit' to exit application.
            ------------------------------------------------------------------------------------------------------
            DOC

 
            input = gets.strip.downcase
       
            if input == "search"
                search

                #clear_screen
                puts "Search finished. Run list to see recipes"
            elsif input == "list"
             
                list_recipes
            elsif input == "exit"
                goodbye
                exit 1

            


            elsif input.to_i > 0
              
                if input.to_i <= EasyMeals::Recipe.all.size
                    recipe = EasyMeals::Recipe.all[input.to_i-1]
                    recipe.display_self
                else
                    puts "Invalid index."
                end
            else
                puts "Invalid command. Please type a valid command."
            end

        end
    end
  
  
  
end