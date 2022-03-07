class RecipesController < ApplicationController
  def selection

    @recipe = Recipe.find(params[:id])
    @favorite = current_user.favorites.find_by(recipe: @recipe)
    #search with the ingredirents
    #@recipes = Recipe.select(params)
  end

  # yes to the show page with all the instructions
  def show
    @recipe = Recipe.find(params[:id])
    @favorite = current_user.favorites.find_by(recipe: @recipe)
  end
end
