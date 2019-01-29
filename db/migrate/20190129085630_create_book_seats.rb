class CreateBookSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :book_seats do |t|
      t.integer :user_id
      t.integer :desk_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
