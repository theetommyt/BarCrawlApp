class Drinker < ActiveRecord::Base

  has_secure_password

  has_many(:chats)

  has_many(:images)

end
