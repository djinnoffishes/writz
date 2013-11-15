class AddStoryIdToStoryComponents < ActiveRecord::Migration
  def change
    add_column :story_components, :story_id, :integer
  end
end
