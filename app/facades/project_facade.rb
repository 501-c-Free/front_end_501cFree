class ProjectFacade
  def self.get_all_projects
    json = ProjectService.get_all_projects
    json[:data].map do |project_data|
      Project.new(project_data)
    end
  end

  def self.get_user_projects(id)
    json = ProjectService.get_user_projects(id)
    if json[:data].any?
      projects = json[:data].map do |project_data|
        Project.new(project_data)
      end
    end
    return projects
  end

  def self.get_project(id)
    response = ProjectService.get_project(id)
    Project.new(response[:data])
  end
end
