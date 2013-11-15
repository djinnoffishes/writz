class Contributer < ActiveRecord::Base

  belongs_to :user
  belongs_to :story_component

  # allow_nil for tests
  delegate :name, :email, to: :user, allow_nil: true

end
