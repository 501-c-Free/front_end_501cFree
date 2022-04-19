class ProjectService
  def self.connect
    Faraday.new(url: ENV['env_url'])
  end

  def self.create_project(user)
    response = connect.post('/api/v1/projects') do |req|
      req.params['user_id'] = user
      req.params['project_name'] = project_name
      req.params['description'] = description
    end
    return JSON.parse(response.body, symbolize_names: true)
  end
end
