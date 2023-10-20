class FoodsController < ApplicationController
  before_action :authenticate_user!

    def index
    @foods = Food.all
  end

  def new
    @food = Food.new
    render layout: 'navbar_layout'
  end

  # Add the create action
  def create
    @food = current_user.foods.build(food_params)
    # @food = Food.new(food_params)

    if @food.save
      redirect_to recipes_path, notice: 'Food was successfully created.'
    else
      render 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    # redirect_to foods_path, notice: 'Food deleted successfully'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
