class NonProfitsController < ApplicationController
  def index
    
  end

  def new
  end

  def create
    @charity_info = NonProfitService.charity_info(params[:ein], current_user)
    if @charity_info[:error].present?
      redirect_to new_representative_path, notice: 'Charity not found. Please verify!'
    else
      redirect_to non_profit_path
    end
  end

  def show
    # this needs to change to different api endpoint independent of creation
    if current_user 
      @charity_info = NonProfitService.get_user_charity(current_user)
    else # non profit if not logged in
      @charity_info = NonProfitService.get_user_charity(params[:id])
    end
  end
end
