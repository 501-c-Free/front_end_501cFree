class DevelopersController < ApplicationController
  def new
    @user = current_user
    DeveloperService.create_dev(@user)
    # Now we have a fully created User object with associated Developer. Our view will have form for more information
  end

  def create
    binding.pry
    # add developer to user 

    # data = {
    #   email: params[:email],
    #   github: params[:github],
    #   linkedin: params[:linkedin]
    # }
  end

  def show

  end
end
