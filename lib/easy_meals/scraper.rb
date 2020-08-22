class EasyMeals::Scraper
  
  def self.search_url(search_word)
        search_url = "https://tasty.co/topic/5-ingredients-or-less"
        recipies_only_filter = "/CUSTOM_FACET:RECIPE_FACET"

        split_term = search_term.split(" ")

        split_term.each { |term|
            search_url << term + "-"
        }

        search_url << recipies_only_filter
        get_page_and_recipes(search_url, search_term)
  end
