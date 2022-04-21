class ProjectService
  def self.conn
    Faraday.new(url: ENV['env_url'])
  end

  def self.get_user_projects(dev_id)
    response = conn.get("/api/v1/developer/#{dev_id}/projects")
    attrs = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_all_projects
    response = conn.get("/api/v1/projects")
    attrs = JSON.parse(response.body, symbolize_names: true)
  end


  def self.create_project(user, project_name, description)
    response = conn.post('/api/v1/projects') do |req|
      req.params['user_id'] = user
      req.params['project_name'] = project_name
      req.params['description'] = description
    end
  end
end
