class DashboardsController < ApplicationController



  def show
    @user = current_user
    @rented_offers = @user.rented_offers #marche seulement car on a crée rented_offers in user model
    # ou on aurait pu ecrire @rented_offers = Booking.joins(:offer).joins(:user).where(offer: {user: @user})
    # ou encore @bookings_requests = []
    # @user.offers.each { |offer| @bookings_requests << offer.bookings}

    @upcoming_bookings = @user.bookings.select { |booking| booking.date >= Date.today}
    @past_bookings = @user.bookings.select { |booking| booking.date < Date.today}
    @pending_booking = @user.bookings.select { |booking| booking.status == "pending" }
    @validate_booking = @user.bookings.select { |booking| booking.status == "validate" }

  end
end
