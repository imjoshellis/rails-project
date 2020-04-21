class SprintsController < ApplicationController

  def show
    @sprint = Sprint.find(params[:id])
  end

  def new
  end
end
