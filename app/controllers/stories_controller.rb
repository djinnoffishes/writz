class StoriesController < ApplicationController

  def index
    @stories = Story.all.paginate(page: params[:page], per_page: 7)
  end

  def show
    @story = Story.find(params[:id])
    
    if @story.intro
      @intro_id = @story.intro.id
      @intro_body = @story.intro.body
    else
      @intro_id = ''
      @intro_body = 'This story needs an introduction!'
    end

    if @story.conflict
      @conflict_id = @story.conflict.id
      @conflict_body = @story.conflict.body
    else
      @conflict_id = ''
      @conflict_body = 'This story needs a conflict!'
    end

    if @story.resolution
      @resolution_id = @story.resolution.id
      @resolution_body = @story.resolution.body
    else
      @resolution_id = ''
      @resolution_body = 'This story needs a resolution!'
    end

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

  def update
  end

  def destroy
  end

  private

  def story_params
    params.require(:story).permit(:title)
  end

end