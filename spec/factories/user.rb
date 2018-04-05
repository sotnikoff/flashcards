FactoryBot.define do
  factory :user do
    email 'example@mydomain.com'
    password_hash '$2a$10$EvR4dTsn7G0kvju9A/jeZ.tkm/kJLsXqxZEjlG3rEuS4b0MnRLwMW' # 123456
  end
end
