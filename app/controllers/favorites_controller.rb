class FavoritesController < ApplicationController

  before_action :set_favorite, only: :destroy
  before_action :set_list, only: [:new, :create]


  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = Favorite.new
    @favorite.recipe = @recipe
    @favorite.user = current_user
    @favorite.save
    redirect_to selection_path(@recipe)
  end

  def dashboard
    @favorite_recipes = current_user.recipes
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to selection_path(@recipe)
  end

  private
  def favorite_params
    params.require(:favorite).permit(:user_id, :recipe_id)
  end
end
