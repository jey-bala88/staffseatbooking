class DailyNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	today_bookings = BookSeat.where("DATE(created_at) = ?", Date.today)
    AappMailer.send_report(today_bookings).deliver_now
  end
end
