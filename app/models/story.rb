class Story < ActiveRecord::Base
  has_many :story_components
  has_many :contributers
  has_many :users, through: :contributers

  validates :title, presence: true

  COMPONENT_TYPES = ['intro', 'conflict', 'resolution']

  def missing_component_types
    self.story_components.collect(&:component_type) - COMPONENT_TYPES
  end

  def complete?
    self.missing_component_types.empty?
  end

  def intro
    self.story_components.where(component_type: 'intro').first
  end

  def conflict
    self.story_components.where(component_type: 'conflict').first
  end

  def resolution
    self.story_components.where(component_type: 'resolution').first
  end

end