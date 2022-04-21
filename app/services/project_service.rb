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
  def self.get_project(id)
    response = conn.get("/api/v1/projects/#{id}")
    attrs = JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.update_project(project_id, name, description, dev_id)
    response = conn.patch("/api/v1/projects/#{project_id}") do |req|
      req.params[:name] = name
      req.params[:description] = description
      req.params[:developer_id] = dev_id
    end
  end


  def self.create_project(user, project_name, description)
    response = conn.post('/api/v1/projects') do |req|
      req.params['user_id'] = user
      req.params['project_name'] = project_name
      req.params['description'] = description
    end
  end
end
