class SendPendingMailJob < ApplicationJob
  queue_as :default

  def perform
    UsersWithCards.call.each do |user|
      UserMailer.with(user: user).pending_cards.deliver_now
    end
  end
end
