require 'bcrypt'

module Authenticate
  def self.call(hash, password)
    BCrypt::Password.new(hash).is_password?(password)
  end
end
