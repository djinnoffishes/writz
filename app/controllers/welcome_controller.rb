class WelcomeController < ApplicationController
  def index
    @top_stories = Story.all.sample(3)
  end

  def about
  end
end
