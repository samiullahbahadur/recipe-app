class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).includes(:recipe_foods).order(created_at: :desc)
  end
end
