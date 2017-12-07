class ReportWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  sidekiq_options retry: false

  recurrence do
    hourly.minute_of_hour(21, 22, 23, 24, 27, 28, 29, 30, 31)
  end

  def perform(start_date)
    puts "Sidekiq process started at #{start_date}"
  end
end
