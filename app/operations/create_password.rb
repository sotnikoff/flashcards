require 'bcrypt'

module CreatePassword
  def self.call(unencrypted_password)
    BCrypt::Password.create(unencrypted_password)
  end
end
