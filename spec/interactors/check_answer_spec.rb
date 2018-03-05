require 'rails_helper'

RSpec.describe CheckAnswer do
  describe 'Checking for correct answer' do
    let(:create_card) { create :card }

    it 'returns correct answer message when correct answer provided' do
      card = create_card
      result = CheckAnswer.call(card, card.translated_text)
      expect(result).to eq(I18n.t('answers.create.correct'))
    end

    it 'returns wrong answer message when wrong answer provided' do
      card = create_card
      result = CheckAnswer.call(card, card.translated_text.reverse)
      expect(result).to eq(I18n.t('answers.create.wrong'))
    end

    it 'returns correct answer message when correct answer provided with different case' do
      card = create_card
      result = CheckAnswer.call(card, card.translated_text.upcase)
      expect(result).to eq(I18n.t('answers.create.correct'))
    end
  end
end
