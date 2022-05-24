class DeleteColumnsToBooking < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :quantity
    remove_column :bookings, :total_price
    remove_column :bookings, :comment
    add_column :bookings, :note_seller, :integer
    add_column :bookings, :note_buyer, :integer
    add_column :bookings, :comment_to_buyer, :text
    add_column :bookings, :comment_to_seller, :text
    add_column :offers, :category, :string
  end
end
