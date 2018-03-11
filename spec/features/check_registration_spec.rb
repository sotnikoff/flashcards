require 'rails_helper'

describe 'Check registration' do
  scenario 'Visit registration page' do
    visit sign_up_page_path
    expect(page).to have_content 'Registration'
  end

  scenario 'Fill registration form and sign up' do
    visit sign_up_page_path
    within '#registration-form' do
      fill_in 'email', with: 'some.random.mail@example.com'
      fill_in 'password', with: 'secretPhrase'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Registration done!'
  end
end
