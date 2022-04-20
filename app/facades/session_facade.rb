class SessionFacade
  def self.log_in(data)
    SessionService.log_in(data)
  end
end
