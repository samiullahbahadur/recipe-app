class FoodsController < ApplicationController
  def index
    @food=Food.all
  end

  def new
    @food=Food.new
    @user = current_user
  end
  def create 
    @food =Food.new(food_params)
    @food.user=current_user
    if @food.save
      flash[:notice]="New Food successfully Saved! "
      redirect_to foods_path

    else
      flash[:alert]="somethings was wrong "
      render 'new'
    end
  end
  private
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
