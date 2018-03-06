require 'rails_helper'

describe 'the answering process' do
  let(:create_card) do
    card = create :card
    card.update(review_date: Time.now)
    card
  end

  scenario 'visit empty main page' do
    visit '/'
    expect(page).to have_content I18n.t('answers.new.no_cards')
  end

  scenario 'visit main page with cards' do
    create_card
    visit '/'
    expect(page).to have_content 'Zuhause'
  end

  scenario 'answer with translated text' do
    card = create_card
    visit '/'
    within '#answers-form' do
      fill_in 'answer', with: card.translated_text
    end
    click_button I18n.t('answers.new.button')
    expect(page).to have_content I18n.t('answers.create.correct')
  end
end
