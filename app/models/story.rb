class Story < ActiveRecord::Base
  has_many :story_components
  has_many :contributers
  has_many :users, through: :contributers

  COMPONENT_TYPES = ['intro', 'conflict', 'resolution']

  def missing_component_types
    self.story_components.collect(&:component_type) - COMPONENT_TYPES
  end

  def complete?
    self.missing_component_types.empty?
  end

end