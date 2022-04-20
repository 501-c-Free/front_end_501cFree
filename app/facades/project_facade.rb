class ProjectFacade
  def self.get_project(id)
    json = ProjectService.get_developer(user)
    Project.new(json[:data])
  end

  def self.get_projects(user)
    json = ProjectService.get_projects(user)
    
  end
end
