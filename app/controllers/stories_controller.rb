class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
    @components = StoryComponent.where('component_type = intro', @story)
    @conflict = StoryComponent.where('component_type = conflict', @story)
    @resolution = StoryComponent.where('component_type = resolution', @story)

    render(:layout => false) if request.xhr?
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params.merge(creator_id: current_user.id))

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'You started a story!' }
        format.json { render action: 'show', status: :created, location: @story }
      else
        format.html { render action: 'new' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def story_params
    params.require(:story).permit(:title)
  end

end