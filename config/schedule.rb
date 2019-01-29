every :day, at: '11:50 pm' do
  runner 'DailyNotificationJob.perform_now'
end
