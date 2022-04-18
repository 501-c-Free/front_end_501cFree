class NonProfitsController < ApplicationController
  def new
  end
  
  def create
    @charity_info = NonProfitService.charity_info(params[:ein], current_user)
    if @charity_info[:error]
      redirect_to representatives_new_path, alert: "Not found!"
    else 
      redirect_to non_profit_path(charity: @charity_info)
    end
  end

  def show
    @charity_info = params[:charity]
    binding.pry
  end
end