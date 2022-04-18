class RepresentativesController < ApplicationController
  def new
    @user = current_user
    RepresentativeService.create_representative(@user)
  end

  def create
  end

  def show

  end
end