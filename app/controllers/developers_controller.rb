class DevelopersController < ApplicationController
  def new

  end

  def create
    data = {
      email: params[:email],
      github: params[:github],
      linkedin: params[:linkedin]
    }
    DeveloperService.create_dev(data)
  end

  def show

  end
end
