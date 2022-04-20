class DevelopersController < ApplicationController
  def new
    @user = current_user
    DeveloperService.create_dev(@user, github = nil, linkedin = nil)
  end

  def create
    @user = current_user
    DeveloperService.create_dev(@user, params[:github], params[:linkedin])
    redirect_to developer_path
  end

  def show
    user = current_user
    @user = DeveloperFacade.get_developer(user)
    @projects = ProjectFacade.get_user_projects(user)
  end
end
