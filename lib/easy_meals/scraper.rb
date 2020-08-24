require 'nokogiri'
require 'open-uri'
require 'json'
require 'httparty'


class EasyMeals::Scraper




  
  def self.search_url(search_word)
    main_url = "https://www.allrecipes.com/search/?q=" + search_word
    doc = Nokogiri::HTML(open(main_url))
    rows = doc.css("div.tcb-flex-row") # get the rows that contain the categories
    rows.shift # remove garbage row

    
   # puts doc
    rows = doc.css(".fixed-recipe-card__info")
    

    full_recipe_urls = []
    all_recipes = []
    # Find links in this search page page.
    rows.each do |row|

      # Find the Url in each item  from the main_url
      single_recipe_url = row.css("h3 a").attr("href")

      # Store the URL in a list / array of all url_recipes.
      full_recipe_urls << single_recipe_url
      

      puts "Fetching Recipe at url: " + single_recipe_url
      
      newRecipeInstance = self.get_single_recipe_from_url(single_recipe_url)
      all_recipes << newRecipeInstance;

    end

    # Return a list over all the recipes we found in the search
    return all_recipes

   end
    #rows.each do |row|
    #  name = row.css("span.tcb-button-text").text # Returns "All #{category.name} Recipes"
    #  name.slice!("All ")
    #  name.slice!(" Recipes")
    #  url = row.css("a").attr("href").value
    #  self.new(name, url)
    
    
    
        # #search_url = "https://www.allrecipes.com/search/"
        # recipies_only_filter = "/CUSTOM_FACET:RECIPE_FACET"

        # split_word = search_word.split(" ")

        # split_word.each { |word|
        #     search_url << word + "-"
        # }

        # search_url << recipies_only_filter
        # #get_page_and_recipes(search_url, search_word)
    #end


   


    def self.get_single_recipe_from_url(single_recipe_url)
      # Open a new webpage following this recipes URL
      single_recipe_doc = Nokogiri::HTML(open(single_recipe_url))
      #single_recipe_doc.css(".recipe-content")

      # Prepare and fill variables that we will use to create a new EasyMeals::Recipe
      name = single_recipe_doc.css(".headline-wrapper .heading-content").inner_html
      #name = self.remove_initial_space_characters(name) #remove empty spaces before the name 
      #name = self.remove_trailing_space_characters(name) #remove empty spaces after the name


      url = single_recipe_url
      recipe = single_recipe_doc.css(".recipe-summary p").inner_html;




      #Get total time from the webpage. 
      total_time_HTMLelement = single_recipe_doc.css(".recipe-meta-item-body")[2]
      total_time = "unknown" # Some recipes dont have a time value so add this just in case.
      if total_time_HTMLelement != nil 
        #puts self.remove_space_characters_before_and_after(total_time_HTMLelement.inner_html)
        #total_time = self.remove_space_characters_before_and_after( total_time_HTMLelement.inner_html )
      end 




      # Scrape ingredients from current single page.
      ingredients = []
      rows_ingredients = single_recipe_doc.css(".ingredients-item-name")
      rows_ingredients.each do |ingredient|
        #puts ingredient.inner_html
       # ingredients << self.remove_space_characters_before_and_after( ingredient.inner_html ) 

      end





      # Scrape directions from current single page.
      directions = []
      rows_directions = single_recipe_doc.css(".instructions-section-item")
      rows_directions.each do |direction|
        #puts direction.css(".paragraph p").inner_html
        directions << ( direction.css(".paragraph p").inner_html)
      end




      # Create a new instance of the EasyMeals::Recipe class we created in the recipe.rb file.
      # Send the data we caught from out inner-Nokogiri search and put them inside this new EasyMeals:Recipe instance.
      return EasyMeals::Recipe.new(name,url,recipe,ingredients,directions,total_time)

    end
end
   #def self.get_page_and_recipes(url, search_word)