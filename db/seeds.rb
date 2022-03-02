# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning the DB"

Recipe.destroy_all
Ingredient.destroy_all

puts "Creating recipes"

ingredients = Ingredient.create([
  {name: "Shrimp", category: "protein"},
  {name: "Rice", category: "vegetable"},
  {name: "Chicken", category: "protein"},
  {name: "Salt", category: "carb" },
  {name: "Peas", category: "vegetable"},
  {name: "Beef", category: "protein"},
  {name: "Noodles", category: "carb"},
  {name: "Carrot", category: "vegetable"},
  {name: "Tomato", category: "vegetable"}
])


recipe1 = Recipe.create(name: "Shrimp Fried Rice",
              description: "Filled with color and taste that makes it vanish fast. Bacon adds crispness and a hint of heartiness.",
              minutes: 20, nutritional_info: "332 calories",
              instructions: "1. In a large skillet, melt 1 tablespoon butter over medium-high heat. Pour eggs into skillet. As eggs set, lift edges, letting uncooked portion flow underneath. Remove eggs and keep warm. 2. In the same skillet, melt the remaining 3 Tbsp.",
              )
              recipe1.ingredient_recipes = ingredients.sample(5)
              file = URI.open("https://www.tasteofhome.com/wp-content/uploads/2018/01/exps17773_THD143241D01_07_4b_WEB-8.jpg?fit=700,1024")
              recipe1.photo.attach(io: file, filename: "shrimp.jpg", content_type: "image/jpg")


# recipe2 = Recipe.create(name: "Chicken Fried Rice",
#               description: "Filled with color and taste that makes it vanish fast. Bacon adds crispness and a hint of heartiness.",
#               minutes: 20, nutritional_info: "332 calories",
#               instructions: "1. In a large skillet, melt 1 tablespoon butter over medium-high heat. Pour eggs into skillet. As eggs set, lift edges, letting uncooked portion flow underneath. Remove eggs and keep warm. 2. In the same skillet, melt the remaining 3 Tbsp.",
#               )
#               recipe2.ingredients = ingredients.sample(5)
#               file = URI.open("https://www.kitchensanctuary.com/wp-content/uploads/2020/04/Chicken-Fried-Rice-tall-FS-6.webp")
#               recipe2.photo.attach(io: file, filename: "chicken.jpg", content_type: "image/jpg")
# recipe3 = Recipe.create(name: "Singapore Fried Noodles",
#               description: "Filled with color and taste that makes it vanish fast. Bacon adds crispness and a hint of heartiness.",
#               minutes: 20, nutritional_info: "332 calories",
#               instructions: "1. In a large skillet, melt 1 tablespoon butter over medium-high heat. Pour eggs into skillet. As eggs set, lift edges, letting uncooked portion flow underneath. Remove eggs and keep warm. 2. In the same skillet, melt the remaining 3 Tbsp.",
#               )
#               recipe3.ingredients = ingredients.sample(5)
#               file = URI.open("https://www.simplyrecipes.com/thmb/6hpmUSkDMszlkolq_JcDw3Y9h6A=/648x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2018__04__Singapore-Noodles-LEAD-VERTICAL-8b61809f44854233971cd3c52040de93.jpg")
#               recipe3.photo.attach(io: file, filename: "singapore.jpg", content_type: "image/jpg")
# recipe4 = Recipe.create(name: "Beef soup",
#               description: "Filled with color and taste that makes it vanish fast. Bacon adds crispness and a hint of heartiness.",
#               minutes: 20, nutritional_info: "332 calories",
#               instructions: "1. In a large skillet, melt 1 tablespoon butter over medium-high heat. Pour eggs into skillet. As eggs set, lift edges, letting uncooked portion flow underneath. Remove eggs and keep warm. 2. In the same skillet, melt the remaining 3 Tbsp.",
#               )
#               recipe4.ingredients = ingredients.sample(5)
#               file = URI.open("https://kimchimari.com/wp-content/uploads/2018/05/Beef-and-Radish-Soup-Seogogi-Mu-Guk.jpg")
#               recipe4.photo.attach(io: file, filename: "beef.jpg", content_type: "image/jpg")
# recipe5 = Recipe.create(name: "Shrimp Fried Noodles",
#               description: "Filled with color and taste that makes it vanish fast. Bacon adds crispness and a hint of heartiness.",
#               minutes: 20, nutritional_info: "332 calories",
#               instructions: "1. In a large skillet, melt 1 tablespoon butter over medium-high heat. Pour eggs into skillet. As eggs set, lift edges, letting uncooked portion flow underneath. Remove eggs and keep warm. 2. In the same skillet, melt the remaining 3 Tbsp.",
#               )
#               recipe5.ingredients = ingredients.sample(5)
#               file = URI.open("https://healthyfitnessmeals.com/wp-content/uploads/2018/10/Shrimp-stir-fry-zoodles.jpg")
#               recipe5.photo.attach(io: file, filename: "shrimpfried.jpg", content_type: "image/jpg")

puts "Recipes created"
