class CalendarsController < ApplicationController
  def create
    response = CalendlyFacade.get_calendar(params[:code])
    @charity_info = NonProfitService.update_charity(response, session[:user_id])
    redirect_to non_profit_path
  end

  def show
    redirect_to "https://auth.calendly.com/oauth/authorize?client_id=SUtqlCCcfxpKAItDPbfljxbcCxZD2uYrQ52Q5gZ17qI&response_type=code&redirect_uri=http://localhost:5000/oauth/callback"
  end
end
