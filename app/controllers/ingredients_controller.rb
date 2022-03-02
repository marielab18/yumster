class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(:id)
  end
end
