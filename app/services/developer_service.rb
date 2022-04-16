class DeveloperService
  def self.connect
    Faraday.new(url: 'http://localhost:3000')
  end

  def self.create_dev(user)
    response = connect.post('/api/v1/create_developer') do |req|
      req.params['user_id'] = user
      req.params['type_of_user'] = 'developer'
    end
  end
end
