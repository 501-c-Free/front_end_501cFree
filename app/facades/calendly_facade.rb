class CalendlyFacade
  def self.get_calendar(code)
    CalendlyService.get_calendar(code)
  end
end
