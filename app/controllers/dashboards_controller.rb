class DashboardsController < ApplicationController



  def show
    @user = current_user
    # @test = Booking.all.where(offer: {user: @user})
    # @im_seller = Booking.joins(:offer).joins(:user).where(offer: {user: @user})
    @upcoming_bookings = @user.bookings.select { |booking| booking.date >= Date.today}
    @past_bookings = @user.bookings.select { |booking| booking.date < Date.today}
    @pending_booking = @user.bookings.select { |booking| booking.status == "pending" }

  end
end
