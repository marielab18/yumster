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


  def search
    @recipes = Recipe.all
    @recipes = @recipes.filter do |recipe| 
      ingredients_ids = recipe.ingredients.pluck(:id)
      ingredients_ids.include?(query(:protein)) &&
      ingredients_ids.include?(query(:carb)) && 
      ingredients_ids.include?(query(:vegetable))
    end
    redirect_to selection_path(@recipes.sample)
  end

  private

  def query(category)
    params.require(:search)[category].to_i
  end

end

