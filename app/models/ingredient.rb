class Ingredient < ApplicationRecord
  has_many :ingredient_recipes, dependent: :destroy
  has_one_attached :photo
end
