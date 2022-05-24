class AddQuantityToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :quantity, :integer
    add_column :bookings, :total_price, :decimal, :precision => 8, :scale => 2
  end
end
