class RepresentativeService
  def self.connect
    Faraday.new(url: ENV['env_url'])
  end

  def self.create_representative(user)
    response = connect.post('/api/v1/create_representative') do |req|
      req.params['user_id'] = user
      req.params['type_of_user'] = 'representative'
    end
  end
end
