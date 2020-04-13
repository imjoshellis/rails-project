class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      redirect_to user_path(user)
    else
      redirect_to :new
    end
  end
end
