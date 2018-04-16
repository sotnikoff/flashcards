require 'sidekiq-scheduler'

class SendPendingCardsMail
  include Sidekiq::Worker

  def perform
    ::UserMailer.with(user: User.first).pending_cards.deliver_now
  end
end
