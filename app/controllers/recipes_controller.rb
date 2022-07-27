class RecipesController < ApplicationController
  def index
  end

  def new
    @recipe=Recipe.new
    @user=current_user
  end
end
