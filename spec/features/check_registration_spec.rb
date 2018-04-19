require 'rails_helper'

describe 'Check registration' do
  scenario 'Visit registration page' do
    visit sign_up_page_path(locale: :ru)
    expect(page).to have_content 'Registration'
  end

  scenario 'Fill registration form and sign up' do
    visit sign_up_page_path(locale: :ru)
    within '#registration-form' do
      fill_in 'email', with: 'some.random.mail@example.com'
      fill_in 'password', with: 'secretPhrase'
      fill_in 'password_confirmation', with: 'secretPhrase'
    end
    click_button I18n.t('registrations.new.sign_up')
    expect(page).to have_content I18n.t('registrations.create.registration_done')
  end
end
