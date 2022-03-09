class FavoritesController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = Favorite.new
    @favorite.recipe = @recipe
    @favorite.user = current_user
    @favorite.save

    redirect_back(fallback_location: root_path)
  end

  def dashboard
    @favorite_recipes = current_user.favorites
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @recipe = @favorite.recipe
    @favorite.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :recipe_id)
  end
end
