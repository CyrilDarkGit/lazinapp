class DashboardsController < ApplicationController
  def show
    @user = current_user
    @upcoming_bookings = @user.bookings.select { |booking| booking.date >= Date.today}
    @past_bookings = @user.bookings.select { |booking| booking.date < Date.today}
    @pending_booking = @user.bookings.select { |booking| booking.status = "pending" }
  end
end
