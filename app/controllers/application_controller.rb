class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def set_project_variable
    @project = if params[:project_id]
      Project.find(params[:project_id])
    else
      Project.first
    end
  end
end
