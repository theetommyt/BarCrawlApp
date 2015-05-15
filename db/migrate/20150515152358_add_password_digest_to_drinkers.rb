class AddPasswordDigestToDrinkers < ActiveRecord::Migration
  def change
    add_column :drinkers, :password_digest, :string
  end
end
