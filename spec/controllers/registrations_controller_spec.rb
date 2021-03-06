require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe 'Open registration form' do
    it 'returns http success' do
      get :new, params: { locale: :ru }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Send registration post data' do
    it 'returns user id in session' do
      post :create, params: { email: 'demo@example.net',
                              password: 'secret', password_confirmation: 'secret',
                              locale: :ru
      }
      expect(session[:current_user_id].present?).to eq(true)
    end
  end
end
