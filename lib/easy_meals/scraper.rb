require 'nokogiri'
require 'open-uri'


class EasyMeals::Scraper
  
  def self.search_url(search_word)
        search_url = "https://tasty.co/topic/5-ingredients-or-less"
        recipies_only_filter = "/CUSTOM_FACET:RECIPE_FACET"

        split_word = search_word.split(" ")

         split_word.each { |word|
             search_url << word + "-"
         }

        search_url << recipies_only_filter
        get_page_and_recipes(search_url, search_word)
  end
def self.get_page_and_recipes(url, search_word)
        doc = Nokogiri::HTML(open(url))
        searched_recipes = doc.css(".o-RecipeResult")

        searched_recipes.each do |recipe|
            new_recipe = {}
            new_recipe["name"] = recipe.search(".m-MediaBlock__a-HeadlineText").text
            new_recipe["total_time"]= recipe.search("dd").text
            new_recipe["url"] = recipe.search(".m-MediaBlock__a-Headline a").attr("href").value.gsub("//", "")
            EasyMeals::Recipe.new_from_scrape(new_recipe)
        end
    end

    def self.scrape_recipe(recipe)
        doc = Nokogiri::HTML(open("https://#{https://tasty.co}")) # recipe.url
        recipe.ingredients = []
        recipe.directions = []
        
        ingredients = doc.search(".o-Ingredients__a-Ingredient")
        directions = doc.search(".o-Method__m-Step")

        ingredients.each do |ingredient|
            recipe.ingredients << ingredient.text.strip
        end

        directions.each do |direction|
            recipe.directions << direction.text.strip
        end
    end
end