require 'rails_helper'

RSpec.describe DecksController, type: :controller do
  context 'no deck needed' do
    before(:each) do
      @user = create :user
      session[:current_user_id] = @user.id
    end

    describe 'GET #index' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #new' do
      it 'returns http success' do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      it 'returns http found' do
        post :create, params: {
          deck: {
            title: 'Title of deck',
            description: 'Test description for deck'
          }
        }
        expect(response).to have_http_status(:found)
      end
    end
  end

  context 'deck needed' do
    let(:deck) do
      deck = create :deck
      session[:current_user_id] = deck.id
      deck
    end

    describe 'GET #show' do
      it 'returns http success' do
        get :show, params: { id: deck }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #edit' do
      it 'returns http success' do
        get :edit, params: { id: deck }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'PUT #update' do
      it 'returns http found' do
        post :update, params: {
          id: deck,
          deck: {
            title: 'New title of deck',
            description: 'New test description for deck'
          }
        }
        expect(response).to have_http_status(:found)
      end
    end

    describe 'DELETE #destroy' do
      it 'returns http found' do
        delete :destroy, params: { id: deck }
        expect(response).to have_http_status(:found)
      end
    end
  end
end
