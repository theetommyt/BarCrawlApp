class AddIsAdminToDrinkers < ActiveRecord::Migration
  def change
    add_column :drinkers, :is_admin, :boolean
  end
end
