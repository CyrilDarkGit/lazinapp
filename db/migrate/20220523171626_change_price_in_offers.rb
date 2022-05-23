class ChangePriceInOffers < ActiveRecord::Migration[7.0]
  def change
    change_column :offers, :unit_price, :decimal, :precision => 8, :scale => 2
    # precision is the total number of digits
    # scale is the number of digits to the right of the decimal point
    add_column :offers, :currency, :string
  end
end
