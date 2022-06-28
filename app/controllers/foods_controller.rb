class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new; 
    @food = Food.new
  end

  def create;
    @food = food.new(food_params)
    
    if @food.save
      flash[:success] = 'Food added successfully'
      redirect_to foods_path
    else
      flash.now[:error] = 'Error: Food could not be added'
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy; end

  def food_params
    my_food = params.require(:food).permit(:name, :measurement_id, :price)
    my_food[:user] = current_user
    my_food
  end
end