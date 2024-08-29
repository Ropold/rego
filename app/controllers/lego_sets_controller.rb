class LegoSetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
    @legos = LegoSet.all
  end

  def new
    @lego = LegoSet.new
  end

  def create
    @lego = LegoSet.new(lego_params)
    @lego.user = current_user

    if @lego.save
      redirect_to lego_set_path(@lego)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @lego = LegoSet.find(params[:id])
  end

  def edit
    @lego = LegoSet.find(params[:id])
  end

  def update
    @lego = LegoSet.find(params[:id])
    @lego.update(lego_params)
    redirect_to my_sets_path(@lego)
  end

  def destroy
    @lego = LegoSet.find(params[:id])
    @lego.destroy
    redirect_to my_sets_path
  end

  def my_sets
    @legos = current_user.lego_sets
  end

  private

  def lego_params
    params.require(:lego_set).permit(:lego_nr, :set_name, :release_year, :price_per_day, :photo)
  end
end
