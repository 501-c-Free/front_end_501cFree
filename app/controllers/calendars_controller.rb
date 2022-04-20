class CalendarsController < ApplicationController
  def create
    CalendlyFacade.get_calendar
  end

  def show
    redirect_to "https://auth.calendly.com/oauth/authorize?client_id=SUtqlCCcfxpKAItDPbfljxbcCxZD2uYrQ52Q5gZ17qI&response_type=code&redirect_uri=http://localhost:5000/oauth/callback"
  end
end
