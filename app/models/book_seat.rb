class BookSeat < ApplicationRecord
	belongs_to :user
	belongs_to :desk
end
