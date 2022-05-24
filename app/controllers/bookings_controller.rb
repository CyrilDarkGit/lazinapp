class BookingsController < ApplicationController
  before_action :set_offer, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.offer = @offer
    if @booking.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(:id)
    @booking.destroy
    redirect_to offer_path(@booking.offer)
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :offer_id, :comment, :date)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
