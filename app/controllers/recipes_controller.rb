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
    # @recipe = Recipe.includes(recipe_foods: :food).find(params[:id])
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    render layout: 'navbar_layout' # Specify the layout here
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize! :destroy, @recipe
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  end

  # def update
  #   @recipe = Recipe.find(params[:id])
  #   @recipe.toggle!(:public)
  #   return unless @recipe.save

  #   redirect_to , noticrecipe_pathe: 'Recipe was successfully updated.'
  # end

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
