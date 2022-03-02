lorem = '
Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum ipsum id saepe eligendi ducimus. Corrupti, perspiciatis quo ex distinctio ipsam, dolorum nihil porro, placeat recusandae ad accusantium illo. Sint, soluta?
'

puts 'Create Users'

User.create!(
  email: 'player@one.com',
  password: 123456
)

puts 'Create Ingredients'

Ingredient.create!(
  name: 'Chicken',
  category: 'Protein'
)

Ingredient.create!(
  name: 'Noodles',
  category: 'Carb'
)

puts 'Create Recipes'

Recipe.create!(
  name: 'Curly 🐔 Chicken',
  description: 'Not chicken nuggets, but great',
  minutes: 5,
  nutritional_info: lorem,
  instructions: lorem
)

puts 'Connect Recipe to Ingredients'

# you can use this syntax
IngredientRecipe.create!(
  recipe_id: Recipe.first.id,
  ingredient_id: Ingredient.first.id
)

# or this syntax
Recipe.first.ingredients << Ingredient.last

puts 'Create Favorites'

Favorite.create!(
  user: User.first,
  recipe: Recipe.first
)

