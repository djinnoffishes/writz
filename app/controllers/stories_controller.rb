class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
    @intro = StoryComponent.where('component_type = intro', @story)
    @conflict = StoryComponent.where('component_type = conflict', @story)
    @resolution = StoryComponent.where('component_type = resolution', @story)

    render(:layout => false) if request.xhr?
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end