class DeveloperService
  def self.connect
    Faraday.new(url: ENV['env_url'])
  end

  def self.create_dev(user, github, linkedin)
    response = connect.post('/api/v1/create_developer') do |req|
      req.params['user_id'] = user
      req.params['type_of_user'] = 'developer'
      req.params['github'] = github
      req.params['linkedin'] = linkedin
    end
  end

  def self.get_developer(user)
    response = connect.get("/api/v1/get_developer/#{user}")
    attrs = JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_dev(user)
    response = connect.post('/api/v1/update_developer') do |req|
      req.params['user_id'] = user
      req.params['type_of_user'] = 'developer'
    end
  end

end
