class Recipe < ApplicationRecord
  has_many :ingredient_recipes, dependent: :destroy

  has_many :ingredients, through: :ingredient_recipes

  has_many :favorites, dependent: :destroy
  
  has_one_attached :photo

end
