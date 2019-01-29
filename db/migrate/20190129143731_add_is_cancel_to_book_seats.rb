class AddIsCancelToBookSeats < ActiveRecord::Migration[5.0]
  def change
  	add_column :book_seats, :is_cancelled, :boolean
  end
end
