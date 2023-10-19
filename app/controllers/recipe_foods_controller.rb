class RecipeFoodsController < ApplicationController
    before_action :set_recipe, only: [:new, :create, :destroy]

def new
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end
  
  
  def create
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_foods_params)
  
    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Added new ingredient'
    else
      render 'new'
    end
  end
  
    def destroy
      @recipe_food = RecipeFood.find(params[:id])
      @recipe_food.destroy
  
      redirect_to recipe_path(@recipe), notice: 'Ingredient successfully deleted'
    end
  
    private
  
    def set_recipe
      @recipe = Recipe.includes(recipe_foods: :food).find(params[:recipe_id])
    end
  
    def recipe_foods_params
      params.require(:recipe_food).permit(:food_id, :quantity)
    end
  end
  