class SessionService
  def self.conn
    Faraday.new(
      url: 'http://localhost:3000')
  end

  def self.log_in(data)
    response = conn.post('/api/v1/log_in') do |req|
      req.params['email'] = data[:info][:email]
      req.params['name'] = data[:info][:name]
      req.params['access_token'] = data[:credentials][:token]
    end
    attrs = JSON.parse(response.body, symbolize_names: true)
  end
end
