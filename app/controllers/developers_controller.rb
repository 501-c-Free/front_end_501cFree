class DevelopersController < ApplicationController
  def new
    @user = current_user
    DeveloperService.create_dev(@user)
    # Now we have a fully created User object with associated Developer. Our view will have form for more information
  end

  def create
    
  end

  def show

  end
end
