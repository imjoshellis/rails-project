class StoriesController < ApplicationController
  def index
    @stories = if params[:sprint_id]
      Sprint.find(params[:sprint_id]).stories
    else
      Story.all
    end
  end

  def todo
    @stories = Story.todo
    render :index
  end

  def doing
    @stories = Story.doing
    render :index
  end

  def closed
    @stories = Story.closed
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
    @sprint = Sprint.find(params[:sprint_id])
    @story.update(name: params[:story][:name], description: params[:story][:description], status: params[:story][:status], effort: params[:story][:effort])
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
    @sprint = Sprint.find(params[:sprint_id])
    goal = Goal.find_by(name: params[:story][:goal])
    @story.update(name: params[:story][:name], description: params[:story][:description], status: params[:story][:status], effort: params[:story][:effort], sprint_id: params[:sprint_id], goal: goal)
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
end
