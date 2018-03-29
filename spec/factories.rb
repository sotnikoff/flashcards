FactoryBot.define do
  factory :deck do
    user
    title 'My deck'
    description 'My deck description'
  end
  factory :user do
    email 'example@mydomain.com'
    password_hash '$2a$10$EvR4dTsn7G0kvju9A/jeZ.tkm/kJLsXqxZEjlG3rEuS4b0MnRLwMW' # 123456
  end
  factory :card do
    user
    original_text 'Zuhause'
    translated_text 'home'
  end
end
