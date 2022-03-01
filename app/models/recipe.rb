class Recipe < ApplicationRecord
  has_many :ingredient_recipes
  has_many :favorites
end
