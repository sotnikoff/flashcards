class MailWorker
  include Sidekiq::Worker

  def perform(*args)
    puts args
  end
end
