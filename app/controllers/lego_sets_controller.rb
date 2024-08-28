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

    if @lego.save
      redirect_to lego_set_path(@lego)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @lego = LegoSet.find(params[:id])
  end

  private

  def lego_params
    params.require(:lego_set).permit(:lego_nr, :set_name, :release_year, :price_per_day)
  end
end
