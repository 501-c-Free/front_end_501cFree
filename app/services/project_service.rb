class ProjectService
<<<<<<< HEAD
  def self.connect
    Faraday.new(url: ENV['env_url'])
  end

  def self.create_project(user, project_name, description)
    response = connect.post('/api/v1/projects') do |req|
      req.params['user_id'] = user
      req.params['project_name'] = project_name
      req.params['description'] = description
    end
=======
  def conn
    Faraday.new(url: ENV['env_url'])
  end

  def self.get_projects
    response = conn.get('/api/v1/get_projects')
    attrs = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_project(id)
    response = conn.get('/api/v1/get_project')
    attrs = JSON.parse(response.body, symbolize_names: true)
>>>>>>> 3cde1fa (Feat: Project service #conn, #get_projects, #get_project)
  end
end
