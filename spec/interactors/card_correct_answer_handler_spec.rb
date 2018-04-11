require 'rails_helper'

RSpec.describe CardCorrectAnswerHandler do
  describe 'Performing correct answer' do
    let(:create_card) { create :card }
    it 'returns card when card is provided' do
      card = create_card
      result = CardCorrectAnswerHandler.call(card)
      expect(result.id).to eq(card.id)
      expect(result.step).to eq(1)
    end
  end
end
