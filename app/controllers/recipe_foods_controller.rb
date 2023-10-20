class RecipeFoodsController < ApplicationController
  before_action :set_recipe

  def new
    @recipe_food = RecipeFood.new
  end

  def create
    puts params.inspect
    @recipe_food = @recipe.recipe_foods.build(recipe_foods_params)

    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Added new ingredient'
    else
      puts @recipe_food.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find_by(id: params[:id])

    if @recipe_food
      if @recipe_food.destroy
        redirect_to recipe_path(@recipe), notice: 'RecipeFood deleted successfully'
      else
        redirect_to recipe_path(@recipe), alert: 'Failed to delete RecipeFood'
      end
    else
      redirect_to recipe_path(@recipe), alert: 'RecipeFood not found'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_foods_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
