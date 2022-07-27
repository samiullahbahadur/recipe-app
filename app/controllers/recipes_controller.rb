class RecipesController < ApplicationController
  def index
  end

  def new
    @recipe=Recipe.new
    @user=current_user
  end

  def create 
    @recipe=Recipe.new(recipe_params)
    @recipe.user=current_user
    fi @recipe.save
    flash[:notice]="New recipe successfully Saved! "
    redirect_to recepes_path
  end
end
