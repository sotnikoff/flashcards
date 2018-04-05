FactoryBot.define do
  factory :card_without_user, class: 'Card' do
    original_text 'Zuhause'
    translated_text 'home'
  end
end
