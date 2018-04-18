class UserMailer < ApplicationMailer
  default from: 'flashcards@sandbox1ff0adbfcdff4300aa1bb8ff1a739faf.mailgun.org'

  def pending_cards
    @user = params[:user]
    mail(to: @user.email, subject: 'Cards to review')
  end
end
