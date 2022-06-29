class RecipeFoodsController < ApplicationController
before_action :set_recipe, only: %i[new create]

  def new
    @recipe_food = @recipe.recipe_foods.new
    @foods = current_user.foods.all
  end

  def create
   @recipe_food = @recipe.recipe_foods.new(recipe_food_params)
   if @recipe_food.save
      flash[:success] = 'Ingredient added successfully'
      redirect_to recipe_path(@recipe.id)
    else
      flash.now[:error] = 'Error: Ingredient could not be added'
      render :new, status: :unprocessable_entity
    end
  end

   def destroy
    @recipe_food = RecipeFoods.includes(:recipe, :food).find(params[:id])
    if @recipe_food.destroy
      flash[:success] = 'Recipe was successfully deleted.'
      redirect_to recipes_path
    else
      flash[:error] = 'Something went wrong'
      render :show
    end
  end

  def set_recipe
    @recipe = Recipe.includes(:recipe, :food).find(params[:id])
  end

  def recipe_food_params
   ingredient = params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
