require 'sidekiq-scheduler'

class SendPendingCardsMail
  include Sidekiq::Worker

  def perform
    puts '465465421323456123124'
  end
end
