class GoalsController < ApplicationController
  def index
    @goals = if params[:project_id]
      Project.find(params[:project_id]).goals
    else
      Goal.all
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])

    @sprints = if params[:project_id]
      Project.find(params[:project_id]).sprints
    else
      Sprint.all
    end
  end

  def update
    @sprint = Sprint.find(params[:id])
    @project = @sprint.project
    @sprint.update(name: params[:sprint][:name], project_id: @project.id, start_date: params[:sprint][:start_date], end_date: params[:sprint][:end_date])
    if @sprint.errors.any?
      render :edit
    else
      redirect_to project_sprint_path(@project, @sprint)
    end
  end
end
