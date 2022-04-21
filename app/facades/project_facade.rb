class ProjectFacade
  def self.get_all_projects
    json = ProjectService.get_all_projects
    json[:data].map do |project_data|
      Project.new(project_data)
    end
  end

  def self.get_user_projects(id)
    json = ProjectService.get_user_projects(id)
    json[:data][:attributes][:projects].map do |project_data|
      Project.new(project_data)
    end
  end
end
