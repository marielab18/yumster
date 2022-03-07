class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:search]
      @ingredients_carbs = Recipe.joins(:ingredients).where(:ingredients => { :id =>
        params[:search][:carbs],
      })
      @ingredients_protein = Recipe.joins(:ingredients).where(:ingredients => { :id =>
        params[:search][:protein],
      })
      @ingredients_vegetable = Recipe.joins(:ingredients).where(:ingredients => { :id =>
        params[:search][:vegetable],
      })

      @recipes = @ingredients_carbs & @ingredients_protein & @ingredients_vegetable
      if @recipes.present?
        redirect_to selection_path(@recipes.first)
      else
        # Falta agregar con Java Script
        redirect_to root_path
      end

    else
      @ingredients_carbs = Ingredient.where(category: "Carb")
      @ingredients_protein = Ingredient.where(category: "Protein")
      @ingredients_vegetable = Ingredient.where(category: "Vegetable")
    end
  end
end
