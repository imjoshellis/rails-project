class SessionsController < ApplicationController
  def new
    redirect_to "/" unless session[:user_id].nil?
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to :new
    end
  end
end
