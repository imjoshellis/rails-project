class ProjectsController < ApplicationController
  before_action :require_login

  def index
  end

  private

  def require_login
    redirect_to "/login" unless session.include? :user_id
  end
end
