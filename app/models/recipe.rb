class Recipe < ApplicationRecord
  has_many :ingredient_recipes
  has_many :favorites, through: :ingredient_recipes
end
