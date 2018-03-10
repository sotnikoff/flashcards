require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create :user }

  describe 'Checking login controller' do
    it 'successfully authorize with correct password' do
      authorizing_user = user
      post :create, params: {
        email: authorizing_user.email,
        password: '123456'
      }
      expect(session[:current_user_id]).to eq(authorizing_user.id)
    end

    it 'fails with bad password' do
      authorizing_user = user
      session[:current_user_id] = authorizing_user.id
      delete :destroy
      expect(session[:current_user_id]).to eq(nil)
    end
  end
end
