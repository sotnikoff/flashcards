require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:card) { build :card_without_user }
  before(:each) do
    @user = create :user
    session[:current_user_id] = @user.id
  end
  describe 'GET index' do
    it 'renders the new template' do
      get :index, params: { locale: :ru }
      expect(response).to render_template('index')
    end
  end

  describe 'POST #check' do
    it 'returns http found' do
      created_card = card
      created_card.update(user: @user)
      post :check, params: {
        id: created_card.id,
        answer: created_card.translated_text,
        locale: :ru
      }
      expect(response).to have_http_status(:found)
    end
  end
end
