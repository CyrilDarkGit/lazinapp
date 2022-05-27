class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @offers = Offer.all
    if params[:query].present? && params[:query] != nil
      @offers = policy_scope(Offer.where('name ILIKE ?', "%#{params[:query]}"))
    elsif params[:commit].present?
      @offers = policy_scope(Offer.where('category ILIKE ?', "%#{params[:commit]}"))
    else
      @offers = policy_scope(Offer)
    end

    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { offer: offer })
      }
    end
  end

  def show
    @user = current_user
    authorize @offer
    @booking = Booking.new()
    if @user != nil
      @bookings = @user.rented_offers.select { |booking| booking.offer == @offer } + @user.bookings.select { |booking| booking.offer == @offer}
    end
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    authorize @offer
    if @offer.save
      redirect_to offers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @offer
  end

  def update
    authorize @offer
    @offer.update(offer_params)
    redirect_to offers_path
  end

  def destroy
    authorize @offer
    @offer.destroy
    redirect_to offers_path, status: :see_other
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:name, :unit_price, :overview, :photo, :location, :currency, :category)
  end
end
