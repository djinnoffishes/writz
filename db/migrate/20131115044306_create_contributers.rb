class CreateContributers < ActiveRecord::Migration
  def change
    create_table :contributers do |t|
      t.belongs_to :user
      t.belongs_to :story_component
      t.timestamps
    end
  end
end
