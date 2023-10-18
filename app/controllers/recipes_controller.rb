class RecipesController < ApplicationController
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
    # @recipe = Recipe.includes(recipe_foods: :food).find(params[:id])
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    render layout: 'navbar_layout' # Specify the layout here
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to recipes_path
  end

  # def update
  #   @recipe = Recipe.find(params[:id])
  #   @recipe.toggle!(:public)
  #   return unless @recipe.save

  #   redirect_to recipe_path, notice: 'Recipe was successfully updated.'
  # end

  # def public_recipes
  #   @public_recipes = Recipe.where(public: true)
  # end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time)
  end
end
