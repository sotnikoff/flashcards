require 'rails_helper'

describe 'Auth process' do
  let(:user) { create :user }

  scenario 'visit login page' do
    visit login_page_path
    expect(page).to have_content 'Login page'
  end

  scenario 'pass user data' do
    auth_user = user
    visit login_page_path
    within '#auth-form' do
      fill_in 'email', with: auth_user.email
      fill_in 'password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Successfully logged in'
  end
end
