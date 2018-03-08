require 'rails_helper'
require 'bcrypt'

RSpec.describe Authenticate do
  describe 'Checking password' do
    class ExampleModel
      attr_accessor :hash_password
      def initialize(password)
        @hash_password = BCrypt::Password.create(password)
      end
    end

    it 'returns true when password is correct' do
      test_model = ExampleModel.new('123456')
      result = Authenticate.auth(test_model, '123456')
      expect(result).to eq(true)
    end

    it 'returns false when password is not correct' do
      test_model = ExampleModel.new('123456')
      result = Authenticate.auth(test_model, '0987654')
      expect(result).to eq(false)
    end
  end
end
