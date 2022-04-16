class SessionsController < ApplicationController
  def new;end

  def create
    @data = request.env["omniauth.auth"]
    response = SessionFacade.log_in(@data)
    if response[:user][:type_of_user].nil?
      redirect_to user_choice_path
    else
      #   redirect_to user_dashboard
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:message] = 'You have been logged out'
    redirect_to root_path
  end
end
