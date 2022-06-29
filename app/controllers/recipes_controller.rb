class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:success] = 'Recipe added successfully'
      redirect_to recipes_path
    else
      flash.now[:error] = 'Error: Recipe could not be added'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      flash[:success] = 'Recipe was successfully deleted.'
      redirect_to recipes_path
    else
      flash[:error] = 'Something went wrong'
      render :show
    end
  end

  def recipe_params
    my_recipe = params.require(:recipe).permit(:name, :description)
    my_recipe[:user] = current_user
    my_recipe
  end
end
