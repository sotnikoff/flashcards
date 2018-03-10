require 'bcrypt'

module Auth
  extend self

  def authenticate(hash, password)
    BCrypt::Password.new(hash).is_password?(password)
  end

  def generate(password)
    BCrypt::Password.create(password)
  end
end
