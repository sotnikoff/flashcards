require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:card) { create :card }
  describe 'GET new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    it 'returns http found' do
      created_card = card
      post :create, params: {
        id: created_card.id,
        answer: created_card.translated_text
      }
      expect(response).to have_http_status(:found)
    end
  end
end
