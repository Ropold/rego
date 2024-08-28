class BookingsController < ApplicationController
  def index
    @lego = LegoSet.find(params[:lego_set_id])
    @bookings = @lego.bookings
  end

  def new
    @lego = LegoSet.find(params[:lego_set_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @lego = LegoSet.find(params[:lego_set_id])
    @booking.lego_set = @lego

    if @booking.save
      redirect_to lego_path(@lego)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  # def my_sets
  #   @bookings
  # end

  private

  def booking_params
    params.require(:booking).permit(:rent_start, :rent_end)
  end
end
