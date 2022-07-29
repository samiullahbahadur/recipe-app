class RecipeFoodsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
    @total_value = 0
    @total_items = 0
    @recipe_foods.each do |f|
      @total_value += f.quantity * f.food.price
      @total_items += 1
    end
  end

  def new
    @recipe_food = RecipeFood.new
    @foods = Food.where(user_id: current_user)
    @recipe = Recipe.find(params[:recipe_id])

    redirect_to user_recipe_path(@recipe) unless @recipe.user == current_user
  end

  def create
    recipe_food = RecipeFood.new(recipe_food_params)
    recipe_food.food_id = params[:food_id]
    recipe_food.recipe_id = params[:recipe_id]

    if recipe_food.save
      redirect_to user_recipe_path(id: params[:recipe_id])
      flash[:success] = 'Ingredient was added!'
    else
      redirect_to new_recipe_recipe_food_path
      flash[:error] = 'ERROR, Ingredient not added!'
    end
  end

  def destroy
    RecipeFood.find(params[:id]).destroy
    redirect_to user_recipe_path(id: params[:recipe_id])
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end