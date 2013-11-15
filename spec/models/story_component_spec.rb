require 'spec_helper'

describe StoryComponent do
  it 'should reject an invalid component type' do
    a = FactoryGirl.build(:story_component, component_type: 'bogus').should_not be_valid
  end

  it 'should reject an invalid story_id' do
    a = FactoryGirl.build(:story_component, story_id: 'bogus').should_not be_valid
  end
end
