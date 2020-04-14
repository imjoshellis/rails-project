class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    redirect_to "/login" unless session.include? :user_id
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
