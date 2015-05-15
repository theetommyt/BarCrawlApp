class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :drinker_id
      t.string :message

      t.timestamps null: false
    end
  end
end
