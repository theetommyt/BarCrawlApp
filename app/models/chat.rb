require 'rails/generators'

class Chat < ActiveRecord::Base

  belongs_to(:drinker)

end
