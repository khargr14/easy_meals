class EasyMeals::CLI 
  
  def call
    puts "Welcome !!!
    Easy Fun Fast Meals"
    categories_list
    menu
    happy_eating 
  end

def categories_list
   puts <<-DOC
   Hello its all Tasty Recipes CLI! In this CLI app, you will be able to search for recipes using a keyword such as 'chicken', 'beef' or whatever your heart desires**, then see a list of recipes on Tasty.co  website. You can then request more details on the recipe! Lets make easy fun meals!
   _______________________________________________________________
 Quick ides  
 
   1. 5 Ingredients Or Less
   2. 3 Five-Ingredient Appetizers For Last-Minute 
   3. 4 easy 3-Ingredient Vegetable Side Dishes
 DOC
end

def menu
  puts "Enter the number for quick ideas or type exit when done "
  input = nil
  while input != "exit"
    input = gets.strip.downcase
    case input
    when "1"
      puts "here is the top ideas for 5 ingredinets..."
    when "2"
       puts "here is the top ideas for 3 5 ingredients..."
    when "3"
    puts "here is the top ideas for 4 easy..."
    
end
end  
   end
 
 def happy_eating
   puts " Enjoy your MEAL!!!"
end
   


   #def search
   #     print "What are you looking for"
   #  end

end