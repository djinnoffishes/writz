class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title, null: false
      t.integer :creator_id, null: false

      t.timestamps
    end
    add_index :stories, :creator_id
  end
end
