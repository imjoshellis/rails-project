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

  def new
  end
end
