class SprintsController < ApplicationController
  def index
    @sprints = if params[:project_id]
      Project.find(params[:project_id]).sprints
    else
      Sprint.all
    end
  end

  def show
    @sprint = Sprint.find(params[:id])
  end

  def new
  end

end
