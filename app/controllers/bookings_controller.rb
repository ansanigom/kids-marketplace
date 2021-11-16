class BookingsController < ApplicationController
  def new
    @toy = Toy.find(params[:toy_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.toy = Toy.find(params[:toy_id])
    @booking.user = current_user
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :delivery_option)
  end
end
