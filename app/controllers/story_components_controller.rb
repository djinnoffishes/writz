class StoryComponentsController < ApplicationController
  before_action :set_story_component, only: [:show, :edit, :update, :destroy]

  # GET /story_components/new
  def new
    @story_component = StoryComponent.new
    @story = Story.find(params[:story_id])
    @component_types = ['intro', 'conflict', 'resolution']
    render(:layout => false) if request.xhr?
  end

  def edit
    @story = Story.find(params[:story_id])
    @story_component = StoryComponent.find(params[:id])
    @component_types = ['intro', 'conflict', 'resolution']
    render(:layout => false) if request.xhr?
  end

  # POST /story_components
  # POST /story_components.json
  def create
    #@story_component = StoryComponent.new(story_component_params)
    @story_component = current_user.sc_ownerships.build(story_component_params.merge( 
      contributer_id: current_user.id, 
      story_id: params[:story_id] ))
    @story = Story.find(params[:story_id])

    respond_to do |format|
      if @story_component.save
        format.html { redirect_to @story, notice: 'Story component was successfully created.' }
        format.json { render action: 'show', status: :created, location: @story_component }
      else
        format.html { render action: 'new' }
        format.json { render json: @story_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /story_components/1
  # PATCH/PUT /story_components/1.json
  def update
    @story = Story.find(params[:story_id])
    respond_to do |format|
      if @story_component.update(story_component_params)
        format.html { redirect_to @story, notice: 'Story component was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @story_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /story_components/1
  # DELETE /story_components/1.json
  def destroy
    @story_component.destroy
    respond_to do |format|
      format.html { redirect_to story_components_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story_component
      @story_component = StoryComponent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_component_params
      params.require(:story_component).permit(:contributer_id, :component_type, :body)
    end
end
