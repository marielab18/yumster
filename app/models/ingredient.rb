class Ingredient < ApplicationRecord
  has_many :ingredient_recipes, dependent: :destroy
end
