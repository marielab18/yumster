class RecipesController < ApplicationController
  def selection
    if Recipe.find(params[:id]).present?

      @recipe = Recipe.find(params[:id])
    else

      @recipe = Recipe.first

    end



    #search with the ingredirents
    #@recipes = Recipe.select(params)
  end

  # yes to the show page with all the instructions
  def show
    @recipe = Recipe.find(params[:id])
  end

  # no -take me to the next recipe
  def update
    @recipe = Recipe.find(params[:id])
    @recipe = Recipe.update(recipe_params)

    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:id, :rating, :address)
  end

end
