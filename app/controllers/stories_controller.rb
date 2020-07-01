class StoriesController < ApplicationController
  def index
    @stories = if params[:sprint_id]
      Sprint.find(params[:sprint_id]).stories
    else
      Story.all
    end
  end

  def todo
    if params[:sprint_id]
      @sprint = Sprint.find(params[:sprint_id])
      @stories = @sprint.stories.todo
    else
      Story.all.todo
    end
    render :index
  end

  def doing
    if params[:sprint_id]
      @sprint = Sprint.find(params[:sprint_id])
      @stories = @sprint.stories.doing
    else
      Story.all.doing
    end
    render :index
  end

  def closed
    if params[:sprint_id]
      @sprint = Sprint.find(params[:sprint_id])
      @stories = @sprint.stories.closed
    else
      Story.all.closed
    end
    render :index
  end

  def show
    @story = Story.find(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
    @sprint = Sprint.find(params[:sprint_id])
  end

  def update
    @story = Story.find(params[:id])
    @story.update(story_params)
    if @story.errors.any?
      render :edit
    else
      redirect_to sprint_story_path(@story.sprint, @story)
    end
  end

  def new
    @story = Story.new
    @sprint = Sprint.find(params[:sprint_id])
  end

  def create
    @story = Story.new
    @sprint = Sprint.find(params[:story][:sprint_id])
    @story.update(story_params)
    if @story.errors.any?
      render :new
    else
      redirect_to sprint_story_path(@story.sprint, @story)
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @sprint = @story.sprint
    @story.destroy
    redirect_to project_sprint_path(@sprint.project, @sprint)
  end

  private

  def story_params
    params.require(:story).permit(:name, :description, :status, :effort, :sprint_id)
  end
end
