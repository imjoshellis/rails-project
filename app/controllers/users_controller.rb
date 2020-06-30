class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(name: params[:user][:name], role: params[:user][:role])
    @user.projects.clear
    params[:user][:projects].each do |i|
      @user.projects << Project.find(i)
    end
    @user.save
    if @user.errors.any?
      render :edit
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
