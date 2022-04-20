class ProjectsController < ApplicationController
  def new
  end

  def create
      @user = current_user
      ProjectService.create_project(@user, params[:name], params[:description])
      redirect_to(non_profit_dashboard_path, notice: 'Successfully created!')
  end

  def show

  end
end
