require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  before(:each) do
    @user = create :user
    session[:current_user_id] = @user.id
  end

  context 'no card needed' do
    describe 'GET #index' do
      it 'returns http success' do
        get :index, params: { locale: :ru }
        expect(response).to be_successful
      end
    end

    describe 'GET #new' do
      it 'returns http success' do
        get :new, params: { locale: :ru }
        expect(response).to be_successful
      end
    end

    describe 'POST #create' do
      it 'returns http found' do
        post :create, params: {
          locale: :ru,
          card: {
            original_text: 'Original text for testing',
            translated_text: 'Translated text for testing',
            review_date: Time.now
          }
        }
        expect(response).to have_http_status(:found)
      end
    end
  end

  context 'card needed' do
    let(:card) do
      Card.create(original_text: 'Original text for testing',
                  translated_text: 'Translated text for testing',
                  user: @user,
                  review_date: Time.now)
    end
    describe 'GET #show' do
      it 'returns http success' do
        get :show, params: { id: card, locale: :ru }
        expect(response).to be_successful
      end
    end

    describe 'GET #edit' do
      it 'returns http success' do
        get :edit, params: { id: card, locale: :ru }
        expect(response).to be_successful
      end
    end

    describe 'PUT #update' do
      it 'returns http found' do
        post :update, params: {
          id: card,
          locale: :ru,
          card: {
            original_text: 'Original text for testing updated',
            translated_text: 'Translated text for testing updated',
            review_date: Time.now
          }
        }
        expect(response).to have_http_status(:found)
      end
    end

    describe 'GET #random_card' do
      it 'returns http success' do
        get :random_card, params: { locale: :ru, format: :json }
        expect(response).to be_successful
      end
    end

    describe 'DELETE #destroy' do
      it 'returns http found' do
        delete :destroy, params: { id: card, locale: :ru }
        expect(response).to have_http_status(:found)
      end
    end
  end
end
