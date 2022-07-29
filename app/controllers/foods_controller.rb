class FoodsController < ApplicationController
  def index
    @food = Food.all
  end

  def new
    @food = Food.new
    @user = current_user
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      flash[:notice] = "New Food successfully Saved! "
      redirect_to user_foods_path

    else
      flash[:alert] = "somethings was wrong and name exis  "
      render 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:notice] = "Food was successfully deleted"
    redirect_to user_foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
