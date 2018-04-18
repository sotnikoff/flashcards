class SendPendingMailJob < ApplicationJob
  queue_as :default

  def perform
    User.with_cards.each do |user|
      UserMailer.with(user: user).pending_cards.deliver_now
    end
  end
end
