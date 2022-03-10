class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @ingredients = Ingredient.includes(:photo_blob).includes(:photo_attachment).group_by(&:category)
    @ingredients_carbs = @ingredients['Carb']
    @ingredients_proteins = @ingredients['Protein']
    @ingredients_vegetables = @ingredients['Vegetable']
  end
end
