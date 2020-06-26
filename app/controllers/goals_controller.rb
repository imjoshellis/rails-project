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
    @goal = Goal.find(params[:id])
    @sprint = Sprint.find(params[:goal][:sprint_id])
    @project = @sprint.project
    @goal.update(name: params[:goal][:name], project_id: @project.id, sprint_id: @sprint.id, description: params[:goal][:description])
    if @goal.errors.any?
      render :edit
    else
      redirect_to project_goal_path(@project, @goal)
    end
  end
end
