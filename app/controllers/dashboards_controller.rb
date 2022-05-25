class DashboardsController < ApplicationController
  def show
    @user = current_user
    @upcoming_bookings = @user.bookings.select { |booking| booking.date >= Date.today}
    @past_bookings = @user.bookings.select { |booking| booking.date < Date.today}
  end
end
