require "open-uri"
require_relative 'scraper'


lorem = '
Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum ipsum id saepe eligendi ducimus. Corrupti, perspiciatis quo ex distinctio ipsam, dolorum nihil porro, placeat recusandae ad accusantium illo. Sint, soluta?
'

def build(items, model_class)
  items.each do |item|
    puts "Building #{item[:name]} #{model_class}"
    image_url = item.delete(:image_url)
    model = model_class.create!(item)
    file = URI.open(image_url)
    model.photo.attach(io: file, filename: "#{item[:name].downcase}.png", content_type: 'image/png')
  end
end

Favorite.destroy_all
Ingredient.destroy_all
IngredientRecipe.destroy_all
Recipe.destroy_all
User.destroy_all

puts 'Create Users'

User.create!(
  email: 'mariela@one.com',
  password: 123456
)

puts 'Create Ingredients'

ingredients = [
  { name: 'Noodles', category: 'Carb', image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646318741/development/massa_tpwggn.png' },
  { name: 'Rice', category: 'Carb', image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646319962/development/rice_erdar0.png' },
  { name: 'Chicken', category: 'Protein', image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646317382/chicken_mmehqa.png' },
  { name: 'Shrimp', category: 'Protein', image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646320139/development/shrimp_yh4iir.png' },
  { name: 'Beef', category: 'Protein', image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646320828/development/vaquinha_wvsu1s.png' },
  { name: 'Salmon', category: 'Protein', image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646321716/development/salmon_ocnmrr.png' },
  { name: 'Carrot', category: 'Vegetable', image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646320914/development/carrot_iacktx.png' },
  { name: 'Brocolli', category: 'Vegetable', image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646321046/development/broccoli_sumyza.png' },
  { name: 'Onion', category: 'Vegetable', image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646321329/development/onion_nsck5e.png' },
  { name: 'Garlic', category: 'Vegetable', image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646321523/development/garlic_dldlss.png' },
]

build(ingredients, Ingredient)

puts 'Create Recipes'

recipes = [
  {
    name: 'Curly 🐔 Chicken',
    description: 'Not chicken nuggets, but great',
    minutes: '10Min',
    nutritional_info: '500 Kcal',
    instructions: lorem,
    image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646322010/development/curlychicken_ubqfxe.png'
  },
  {
    name: 'Spicy Chicken',
    description: 'Winner winner chicken dinner',
    minutes: '15Min',
    nutritional_info: '500 Kcal',
    instructions: lorem,
    image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646322242/development/spicychicken_gwlhdw.jpg'
  },
  {
    name: 'Shrimp Pasta',
    description: 'Yummy quick pasta',
    minutes: '10Min',
    nutritional_info: '500 Kcal',
    instructions: lorem,
    image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646322458/development/garlicshrimppasta_qiltqd.jpg'
  },
  {
    name: 'Ceasar Salad',
    description: 'Not chicken nuggets, but healthy',
    minutes: '10Min',
    nutritional_info: '300 Kcal',
    instructions: lorem,
    image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646322819/development/caesarsalad_lruxdq.jpg'
  },
  {
    name: 'Beef Soup',
    description: 'Hong Kong Dim-like',
    minutes: '20Min',
    nutritional_info: '500 Kcal',
    instructions: lorem,
    image_url: 'https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646322982/development/beefsoup_bp5rn8.jpg'
  }
]

build(recipes, Recipe)

puts 'Connect Recipe to Ingredients'

recipes = Recipe.all
ingredients = Ingredient.all

# Join Tables Demo - How to create models in a join table.
# https://github.com/andrerferrer/active-record-join-tables-demo#goal


recipes.first.ingredients << [
  ingredients.first,
  ingredients[4-1],
  ingredients[3-1]
]

# The weird numbers in the square brackets are to reuse what was here before #lazy
recipes[2 - 1].ingredients << [
  ingredients.first,
  ingredients[6-1],
  ingredients[8-1]
]

recipes[3 - 1].ingredients << [
  ingredients[4-1],
  ingredients[9-1],
  ingredients[2-1]
]

recipes[4 - 1].ingredients << [
  ingredients[4-1],
  ingredients[9-1],
  ingredients[2-1],
]

recipes[5 - 1].ingredients << [
  ingredients[5-1],
  ingredients[9-1],
  ingredients[2-1],
]

puts 'Create Favorites'

Favorite.create!(
  user: User.first,
  recipe: Recipe.first
)

puts 'Start scraping'

ingredient = 'chicken'
puts 'Scraping recipes with ' + ingredient.capitalize
chicken_recipes = scrape(ingredient)
build(chicken_recipes, Recipe)
