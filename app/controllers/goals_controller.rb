class GoalsController < ApplicationController
  def index
    @goals = if params[:project_id]
      Project.find(params[:project_id]).goals
    else
      Goal.all
    end
  end
end
