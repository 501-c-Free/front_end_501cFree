class ProjectsController < ApplicationController
  def new
  end

  def create
      @user = current_user
      ProjectService.create_project(@user)
  end

  def show

  end
end
