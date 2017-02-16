# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all


require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

# ingredients["drinks"].select {|k,v| puts k }

ingredient_tab = []

ingredients["drinks"].each do |ingredient_hash|

ingredient_tab << Ingredient.create(name: ingredient_hash.values_at("strIngredient1")[0])

end


# CREATE COCKTAIL

cocktails = []

100.times do |cocktail|

Cocktail.create(name: Faker::RockBand.name)

cocktails << Cocktail.create(name: Faker::RockBand.name)

end

# CREATE DOSES

dose_descriptions = ["un demi", "5 cl", "1l", "3cl", "12g", "50ml"]

100.times do |dose|

Dose.create({
  description: dose_descriptions.sample,
  ingredient: ingredient_tab.sample,
  cocktail: cocktails.sample
  })

end


