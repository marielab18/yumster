require "open-uri"

lorem = '
Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum ipsum id saepe eligendi ducimus. Corrupti, perspiciatis quo ex distinctio ipsam, dolorum nihil porro, placeat recusandae ad accusantium illo. Sint, soluta?
'
# Favorite.destroy_all
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

ing1 = Ingredient.create!(
  name: 'Chicken',
  category: 'Protein'
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646317382/chicken_mmehqa.png')
# ing1 = Ingredient.new(title: 'Chicken', body: "Chicken icon")
ing1.photo.attach(io: file, filename: 'chicken.png', content_type: 'image/png')

ing2 = Ingredient.create!(
  name: 'Noodles',
  category: 'Carb'
)

ing3 = Ingredient.create!(
  name: 'Rice',
  category: 'Carb'
)

ing4 = Ingredient.create!(
  name: 'Shrimp',
  category: 'Protein'
)

ing5 = Ingredient.create!(
  name: 'Beef',
  category: 'Protein'
)

ing6 = Ingredient.create!(
  name: 'Carrot',
  category: 'Vegetable'
)

ing7 = Ingredient.create!(
  name: 'Brocolli',
  category: 'Vegetable'
)

ing8 = Ingredient.create!(
  name: 'Onion',
  category: 'Vegetable'
)

ing9 = Ingredient.create!(
  name: 'Garlic',
  category: 'Vegetable'
)

ing10 = Ingredient.create!(
  name: 'Salmon',
  category: 'Protein'
)



puts 'Create Recipes'

recipe1 = Recipe.create!(
  name: 'Curly 🐔 Chicken',
  description: 'Not chicken nuggets, but great',
  minutes: 5,
  nutritional_info: lorem,
  instructions: lorem
)

recipe2 = Recipe.create!(
  name: 'Spicy Chicken',
  description: 'Winner winner chicken dinner',
  minutes: 15,
  nutritional_info: lorem,
  instructions: lorem
)

recipe3 = Recipe.create!(
  name: 'Shrimp Pasta',
  description: 'Yummy quick pasta',
  minutes: 10,
  nutritional_info: lorem,
  instructions: lorem
)

recipe4 = Recipe.create!(
  name: 'Ceasar Salad',
  description: 'Not chicken nuggets, but healthy',
  minutes: 5,
  nutritional_info: lorem,
  instructions: lorem
)

recipe5 = Recipe.create!(
  name: 'Beef Soup',
  description: 'Hong Kong Dim-like',
  minutes: 5,
  nutritional_info: lorem,
  instructions: lorem
)

puts 'Connect Recipe to Ingredients'

IngredientRecipe.create!(
  recipe_id: recipe1.id,
  ingredient_id: ing1.id
)

IngredientRecipe.create!(
  recipe_id: recipe1.id,
  ingredient_id: ing4.id
)

IngredientRecipe.create!(
  recipe_id: recipe1.id,
  ingredient_id: ing3.id
)

IngredientRecipe.create!(
  recipe_id: recipe2.id,
  ingredient_id: ing1.id
)

IngredientRecipe.create!(
  recipe_id: recipe2.id,
  ingredient_id: ing6.id
)

IngredientRecipe.create!(
  recipe_id: recipe2.id,
  ingredient_id: ing8.id
)


IngredientRecipe.create!(
  recipe_id: recipe3.id,
  ingredient_id: ing4.id
)

IngredientRecipe.create!(
  recipe_id: recipe3.id,
  ingredient_id: ing9.id
)

IngredientRecipe.create!(
  recipe_id: recipe3.id,
  ingredient_id: ing2.id
)


IngredientRecipe.create!(
  recipe_id: recipe4.id,
  ingredient_id: ing4.id
)

IngredientRecipe.create!(
  recipe_id: recipe4.id,
  ingredient_id: ing9.id
)

IngredientRecipe.create!(
  recipe_id: recipe4.id,
  ingredient_id: ing2.id
)

IngredientRecipe.create!(
  recipe_id: recipe5.id,
  ingredient_id: ing5.id
)

IngredientRecipe.create!(
  recipe_id: recipe5.id,
  ingredient_id: ing9.id
)

IngredientRecipe.create!(
  recipe_id: recipe5.id,
  ingredient_id: ing2.id
)
# or this syntax
# Recipe.first.ingredients << Ingredient.last

puts 'Create Favorites'

# Favorite.create!(
#   user: User.first,
#   recipe: Recipe.first
# )
