class SessionsController < ApplicationController
  def new;end

  def create
    @data = request.env["omniauth.auth"]
    SessionFacade.log_in(@data)
  end

  def destroy
    session[:user_id] = nil
    flash[:message] = 'You have been logged out'
    redirect_to root_path
  end
end
