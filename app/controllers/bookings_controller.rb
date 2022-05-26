class BookingsController < ApplicationController
  before_action :set_offer, only: [:new, :create]

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.offer = @offer
    @booking.user = current_user
    @booking.status = 'pending'
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @booking
  end



  def update
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to offer_path(@booking.offer)
  end

  def accepted
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: "accepted")
    redirect_to dashboard_path
  end

  def declined
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: "declined")
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :offer_id, :date, :status)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
