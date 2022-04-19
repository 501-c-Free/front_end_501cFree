class ProjectService
  def self.connect
    Faraday.new(url: ENV['env_url'])
  end

  def self.create_project(user, project_name, description)
    response = connect.post('/api/v1/projects') do |req|
      req.params['user_id'] = user
      req.params['project_name'] = project_name
      req.params['description'] = description
    end
  end
end
