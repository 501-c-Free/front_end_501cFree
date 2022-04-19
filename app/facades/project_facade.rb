class ProjectFacade
  def get_project(id)
    json = ProjectService.get_developer(user)
    Projecgt.new(json[:data])
  end
end
