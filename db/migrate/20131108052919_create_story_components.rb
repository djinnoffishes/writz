class CreateStoryComponents < ActiveRecord::Migration
  def change
    create_table :story_components do |t|
      t.integer :author_id, null: false
      t.string :component_type, null: false
      t.string :body

      t.timestamps
    end
  end
end
