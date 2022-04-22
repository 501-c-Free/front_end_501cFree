class ProjectsController < ApplicationController
  def new
  end

  def index
    @projects = ProjectFacade.get_all_projects
  end

  def create
      @user = current_user
      ProjectService.create_project(@user, params[:name], params[:description])
      redirect_to(non_profit_dashboard_path, notice: 'Successfully created!')
  end

  def show
    @project = ProjectFacade.get_project(params[:id])
    @charity_info = NonProfitService.get_user_charity(@project.owner_id)
  end

  def edit
    @project = ProjectFacade.get_project(params[:id])
    @developers = DeveloperFacade.get_all_developers
  end


  def update
    response = ProjectService.update_project(params[:id], params[:name], params[:description], params[:developer_id])
    redirect_to(project_path(params[:id]), notice: 'Project updated!')
  end
end
