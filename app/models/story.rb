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

  def intro
    if si = self.story_components.where(component_type: 'intro').first
      si.body
    else
      'This story needs an introduction!'
    end
  end

  def conflict
    if sc = self.story_components.where(component_type: 'conflict').first
      sc.body
    else
      'This story needs a conflict!'
    end
  end

  def resolution
    if sc = self.story_components.where(component_type: 'resolution').first
      sc.body
    else
      'This story needs a resolution!'
    end
  end

end