class SessionService
  def self.conn
    Faraday.new(
      url: 'https://localhost:3000/api/v1',
      headers: {'Accept': 'application/json'})
  end

  def self.log_in(data)
    response = conn.post('/log_in') do |req|
      req.params['email'] = data[:info][:email]
      req.params['name'] = data[:info][:name]
      req.params['access_token'] = data[:credentials][:token]
    end
  end
end
