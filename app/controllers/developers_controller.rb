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
    if params[:user_id]
      @user = DeveloperFacade.get_developer(params[:user_id])
      @projects = ProjectFacade.get_user_projects(params[:user_id])
    else 
      @user = DeveloperFacade.get_developer(current_user)
      @projects = ProjectFacade.get_user_projects(current_user)

    end
  end
  
  def edit
    @developer = DeveloperFacade.get_developer(current_user)
  end

  def update
    user = current_user
    DeveloperService.update_dev(user, params[:github], params[:linkedin])
    redirect_to developer_path
  end

  def index 
    @developers = DeveloperFacade.get_all_developers
  end
end
