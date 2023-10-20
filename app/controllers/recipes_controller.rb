class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    render layout: 'navbar_layout'
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])

    if @recipe
      if @recipe.destroy
        redirect_to recipes_path, notice: 'Recipe deleted successfully'
      else
        redirect_to recipes_path, alert: 'Failed to delete the recipe'
      end
    else
      redirect_to recipes_path, alert: 'Recipe not found'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe updated successfully.'
    else
      render 'show'
    end
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
