class ShoppingListsController < ApplicationController
  def index
    recipe_id = params[:recipe_id]
    return unless recipe_id.present?

    # Fetch Recipe
    @recipe = Recipe.find_by(id: recipe_id)
    return redirect_to root_path, alert: 'Recipe not found' unless @recipe

    # Fetch User Foods
    @foods = current_user.foods

    @recipe_foods = @recipe.recipe_foods.includes(:food)

    @needed_money = @recipe_foods.sum { |recipe_food| recipe_food.food.price * recipe_food.quantity }
  end

  def generate
    recipe_id = params[:recipe_id]
    return redirect_to root_path, alert: 'Recipe not found' unless Recipe.exists?(recipe_id)

    redirect_to shopping_lists_path(recipe_id:)
  end
end
