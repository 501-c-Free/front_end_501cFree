class DeveloperFacade
  def get_developer(user)
    json = DeveloperService.get_developer(user)
    Developer.new(json[:data])
  end
end
