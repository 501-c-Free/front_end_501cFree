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
end
