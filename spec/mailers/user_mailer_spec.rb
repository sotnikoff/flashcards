require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'notify' do
    let(:mail) do
      @user = create :user
      UserMailer.with(user: @user).pending_cards
    end

    it 'renders the headers' do
      expect(mail.subject).to eq('Cards to review')
      expect(mail.to).to eq([@user.email])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('You have cards to review!')
    end
  end
end
