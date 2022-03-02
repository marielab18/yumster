class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @ingredients_carbs = Ingredient.where(category: "Carbs")
    @ingredients_protein = Ingredient.where(category: "Protein")
    @ingredients_vegetable = Ingredient.where(category: "Vegetable")
  end
end
