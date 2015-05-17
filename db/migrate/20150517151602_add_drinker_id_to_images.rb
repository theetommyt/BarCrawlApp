class AddDrinkerIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :drinker_id, :integer
  end
end
