class ReportWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(start_date)
    puts "Sidekiq process started at #{start_date}"
  end
end
