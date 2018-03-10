require 'rails_helper'
require 'bcrypt'

RSpec.describe CreatePassword do
  describe 'Creating password' do
    let(:unencrypted_password) { 'someSecretPhrase' }
    let(:encrypted_password) { BCrypt::Password.create(unencrypted_password) }

    it 'creates password' do
      hashed_password = CreatePassword.call(unencrypted_password)
      result = BCrypt::Password.new(hashed_password).is_password?(unencrypted_password)
      expect(result).to eq(true)
    end
  end
end
