require 'spec_helper'

describe Story do
  it 'should reject an invalid creator id' do
    a = FactoryGirl.build(:story, creator_id: 'bogus').should_not be_valid
  end
end
