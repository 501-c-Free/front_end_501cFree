class ProjectService
<<<<<<< HEAD
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
=======
  def self.conn
>>>>>>> 2558a3f (Feat: fix developer and project facades and services)
    Faraday.new(url: ENV['env_url'])
  end

  def self.get_projects(dev_id)
    response = conn.get("/api/v1/developer/#{dev_id}/projects")
    attrs = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_project(id)
    response = conn.get('/api/v1/get_project/')
    attrs = JSON.parse(response.body, symbolize_names: true)
>>>>>>> 3cde1fa (Feat: Project service #conn, #get_projects, #get_project)
  end
end
