require 'rails_helper'
require 'bcrypt'

RSpec.describe Auth do
  context 'Generate password' do
    describe 'Creating password' do
      let(:unencrypted_password) { 'someSecretPhrase' }
      let(:encrypted_password) { BCrypt::Password.create(unencrypted_password) }

      it 'creates password' do
        hashed_password = Auth.generate(unencrypted_password)
        result = BCrypt::Password.new(hashed_password).is_password?(unencrypted_password)
        expect(result).to eq(true)
      end
    end
  end

  context 'Check password' do
    describe 'Checking password' do
      let(:hash) { '$2a$10$EvR4dTsn7G0kvju9A/jeZ.tkm/kJLsXqxZEjlG3rEuS4b0MnRLwMW' }

      it 'returns true when password is correct' do
        result = Auth.authenticate(hash, '123456')
        expect(result).to eq(true)
      end

      it 'returns false when password is not correct' do
        result = Auth.authenticate(hash, 'wrong password')
        expect(result).to eq(false)
      end
    end
  end
end
