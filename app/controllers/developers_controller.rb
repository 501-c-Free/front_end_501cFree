class DevelopersController < ApplicationController
  def new
    @user = current_user
    DeveloperService.create_dev(@user, github = nil, linkedin = nil)
    # Now we have a fully created User object with associated Developer. Our view will have form for more information
  end
  
  def create
    @user = current_user
    DeveloperService.create_dev(@user, params[:github], params[:linkedin])
    # redirect_to developer_show - this route is not made yet? 
  end

  def show
    user = current_user
    @user = DeveloperFacade.get_developer(user)
    #@projects = ProjectFacade.get_projects(user)
  end
end
