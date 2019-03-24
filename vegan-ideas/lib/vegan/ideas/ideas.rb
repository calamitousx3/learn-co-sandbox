require "pry" 

class VeganIdeas::Ideas
  attr_accessor :category, :selection
  @@all = []

  def initialize(category, selection)
    @category = category
    @selection = selection
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    @@all << self.scrape_info
  end

  def self.find_recipe(i)
    self.all[i.to_i - 1]
  end

  def self.scrape_info
    recipes = []

     recipes << self.scrape_breakfast
     recipes << self.scrape_lunch
     recipes << self.scrape_dinner
  end

  def self.scrape_breakfast
    html = open("https://www.tasteaholics.com/recipes/low-carb-breakfast/")
    doc = Nokogiri::HTML(html)

    title = doc.css("div.entry-title").text.gsub(/\t/, "")
    category = doc.css("h1.title-heading-center").text
    breakfast = self.new(title, category)
  end

  def self.scrape_lunch
    html = open("https://www.tasteaholics.com/recipes/low-carb-lunch/")
    doc = Nokogiri::HTML(html)

    title = doc.css("div.entry-title").text.gsub(/\t/, "")
    category = doc.css("h1.title-heading-center").text

    lunch = self.new(title, category)
  end

  def self.scrape_dinner
    html = open("https://www.tasteaholics.com/recipes/low-carb-dinners/")
    doc = Nokogiri::HTML(html)

    title = doc.css("div.entry-title").text.gsub(/\t/, "")
    category = doc.css("h1.title-heading-center").text

    dinner = self.new(title, category)

  end

end
  
  
  
end 