class Drinker < ActiveRecord::Base

  has_secure_password

  has_many(:chats)

  include BCrypt

  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
