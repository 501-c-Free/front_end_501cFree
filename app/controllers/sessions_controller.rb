class SessionsController < ApplicationController
  def new;end

  def create
    @data = request.env["omniauth.auth"]
    response = SessionFacade.log_in(@data)
    
    session[:user_id] = response[:user][:id]
    if response[:user][:type_of_user].nil?
      # representative type of user update needs to be implemented
      redirect_to user_choice_path
    elsif response[:user][:type_of_user] == 'developer'
      #this needs to be made
      # add edit profile link 
      redirect_to developer_path
    else
      redirect_to non_profit_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:message] = 'You have been logged out'
    redirect_to root_path
  end
end
