class AppMailer < ApplicationMailer
	default from: 'notifications@appexample.com'
   
   def send_report(bookings)
      @bookings = bookings
      mail(to: "test@test.com", subject: 'Daily New Booking Report')
   end
end
