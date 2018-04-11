require 'rails_helper'

describe 'the answering process' do
  context 'no cards required' do
    scenario 'visit empty main page' do
      visit '/'
      expect(page).to have_content I18n.t('answers.new.no_cards')
    end
  end

  context 'card required' do
    before(:each) do
      user = create :user
      @card = build :card_without_user
      @card.update!(user: user)
      visit login_page_path
      within '#auth-form' do
        fill_in 'email', with: user.email
        fill_in 'password', with: '123456'
      end
      click_button I18n.t('sessions.new.log_in')
    end

    scenario 'visit main page with cards' do
      visit '/'
      expect(page).to have_content 'Zuhause'
    end

    scenario 'answer with translated text' do
      visit '/'
      within '#answers-form' do
        fill_in 'answer', with: @card.translated_text
      end
      click_button I18n.t('answers.new.button')
      expect(page).to have_content I18n.t('answers.create.correct')
    end
  end
end
