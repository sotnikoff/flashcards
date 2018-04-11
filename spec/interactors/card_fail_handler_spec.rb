require 'rails_helper'

RSpec.describe CardFailHandler do
  describe 'Performing fail answer' do
    let(:create_card) { create :card }
    it 'returns card when card is provided' do
      card = create_card
      result = CardFailHandler.call(card)
      expect(result.id).to eq(card.id)
      expect(result.fails).to eq(1)
    end
  end
end
