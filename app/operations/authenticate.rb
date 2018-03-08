require 'bcrypt'

module Authenticate
  def self.auth(auth_model, password)
    BCrypt::Password.new(auth_model.hash_password) == password
  end
end
