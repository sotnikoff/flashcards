require 'rails_helper'
require 'bcrypt'

RSpec.describe Authenticate do
  describe 'Checking password' do
    before(:each) do
      @hash = '$2a$10$EvR4dTsn7G0kvju9A/jeZ.tkm/kJLsXqxZEjlG3rEuS4b0MnRLwMW'
    end

    it 'returns true when password is correct' do
      result = Authenticate.call(@hash, '123456')
      expect(result).to eq(true)
    end

    it 'returns false when password is not correct' do
      result = Authenticate.call(@hash, 'wrong password')
      expect(result).to eq(false)
    end
  end
end
