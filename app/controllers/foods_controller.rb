class FoodsController < ApplicationController
  def index
  end

  def new
    @food=Food.new
    @user = current_user
  end
end
