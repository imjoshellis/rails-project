class StoriesController < ApplicationController
  def index
    @stories = if params[:sprint_id]
      Sprint.find(params[:sprint_id]).stories
    else
      Story.all
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    @story.update(name: params[:story][:name], description: params[:story][:description], status: params[:story][:status], effort: params[:story][:effort])
    if @story.errors.any?
      render :edit
    else
      redirect_to sprint_story_path(@story.sprint, @story)
    end
  end

  def new
    @story = Story.new
  end
end
