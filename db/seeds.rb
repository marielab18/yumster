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
ing1.photo.attach(io: file, filename: 'chicken.png', content_type: 'image/png')

ing2 = Ingredient.create!(
  name: 'Noodles',
  category: 'Carb'
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646318741/development/massa_tpwggn.png')
ing2.photo.attach(io: file, filename: 'massa.png', content_type: 'image/png')

ing3 = Ingredient.create!(
  name: 'Rice',
  category: 'Carb'
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646319962/development/rice_erdar0.png')
ing3.photo.attach(io: file, filename: 'rice.png', content_type: 'image/png')


ing4 = Ingredient.create!(
  name: 'Shrimp',
  category: 'Protein'
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646320139/development/shrimp_yh4iir.png')
ing4.photo.attach(io: file, filename: 'shrimp.png', content_type: 'image/png')

ing5 = Ingredient.create!(
  name: 'Beef',
  category: 'Protein'
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646320828/development/vaquinha_wvsu1s.png')
ing5.photo.attach(io: file, filename: 'vaquinha.png', content_type: 'image/png')

ing6 = Ingredient.create!(
  name: 'Carrot',
  category: 'Vegetable'
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646320914/development/carrot_iacktx.png')
ing6.photo.attach(io: file, filename: 'carrot.png', content_type: 'image/png')

ing7 = Ingredient.create!(
  name: 'Brocolli',
  category: 'Vegetable'
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646321046/development/broccoli_sumyza.png')
ing7.photo.attach(io: file, filename: 'broccoli.png', content_type: 'image/png')


ing8 = Ingredient.create!(
  name: 'Onion',
  category: 'Vegetable'
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646321329/development/onion_nsck5e.png')
ing8.photo.attach(io: file, filename: 'onion.png', content_type: 'image/png')

ing9 = Ingredient.create!(
  name: 'Garlic',
  category: 'Vegetable'
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646321523/development/garlic_dldlss.png')
ing9.photo.attach(io: file, filename: 'garlic.png', content_type: 'image/png')


ing10 = Ingredient.create!(
  name: 'Salmon',
  category: 'Protein'
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646321716/development/salmon_ocnmrr.png')
ing10.photo.attach(io: file, filename: 'salmon.png', content_type: 'image/png')


puts 'Create Recipes'

recipe1 = Recipe.create!(
  name: 'Curly 🐔 Chicken',
  description: 'Not chicken nuggets, but great',
  minutes: '10Min',
  nutritional_info: '500 Kcal',
  instructions: lorem
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646322010/development/curlychicken_ubqfxe.png')
recipe1.photo.attach(io: file, filename: 'curlychicken.png', content_type: 'image/png')

recipe2 = Recipe.create!(
  name: 'Spicy Chicken',
  description: 'Winner winner chicken dinner',
  minutes: '15Min',
  nutritional_info: '500 Kcal',
  instructions: lorem
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646322242/development/spicychicken_gwlhdw.jpg')
recipe2.photo.attach(io: file, filename: 'spicychicken.png', content_type: 'image/png')

recipe3 = Recipe.create!(
  name: 'Shrimp Pasta',
  description: 'Yummy quick pasta',
  minutes: '10Min',
  nutritional_info: '500 Kcal',
  instructions: lorem
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646322458/development/garlicshrimppasta_qiltqd.jpg')
recipe3.photo.attach(io: file, filename: 'garlicshrimppasta.png', content_type: 'image/png')


recipe4 = Recipe.create!(
  name: 'Ceasar Salad',
  description: 'Not chicken nuggets, but healthy',
  minutes: '10Min',
  nutritional_info: '300 Kcal',
  instructions: lorem
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646322819/development/caesarsalad_lruxdq.jpg')
recipe4.photo.attach(io: file, filename: 'caesarsalad.png', content_type: 'image/png')


recipe5 = Recipe.create!(
  name: 'Beef Soup',
  description: 'Hong Kong Dim-like',
  minutes: '20Min',
  nutritional_info: '500 Kcal',
  instructions: lorem
)
file = URI.open('https://res.cloudinary.com/dv5lwgtlx/image/upload/v1646322982/development/beefsoup_bp5rn8.jpg')
recipe5.photo.attach(io: file, filename: 'beefsoup.png', content_type: 'image/png')

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
