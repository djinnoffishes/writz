class StoryComponent < ActiveRecord::Base
  belongs_to :story
  belongs_to :contributer
  belongs_to :user, through: :contributer


  COMPONENT_TYPES = ['intro', 'conflict', 'resolution']
  validates_inclusion_of :component_type, in: COMPONENT_TYPES
end
