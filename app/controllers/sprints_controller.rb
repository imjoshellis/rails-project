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
    @sprint = Sprint.new
  end

  def create
    @sprint = Sprint.new
    @project = Project.find_by(name: params[:sprint][:project])
    @sprint.update(name: params[:sprint][:name], project_id: @project.id)
    if @sprint.errors.any?
      render :new
    else
      redirect_to project_sprint_path(@project, @sprint)
    end
  end
end
