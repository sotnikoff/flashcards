require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    it 'returns http redirect' do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end
end
