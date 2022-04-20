class CalendlyService
  def self.connect
    Faraday.new(url: "https://auth.calendly.com/")
  end

  def self.get_access_token
    response = connect.post('/oauth/token') do |req|
      req.body = {
        'client_id' => ENV['calendly_client_id'],
        'code' => params[:code],
        'redirect_uri' => ENV['redirect_uri'],
        'grant_type' => 'authorization_code'
        }
    end
    data = JSON.parse(response.body, symbolize_names: true)
    access_token = data[:access_token]
  end

  def self.get_calendar
    get_access_token
    conn = Faraday.new(
      url: 'https://api.calendly.com',
      headers: {
        'Authorization': "Bearer #{access_token}"
      }
    )
    response = conn.get('/users/me')
    data = JSON.parse(response.body, symbolize_names: true)
    @slug = data[:resource][:slug]
  end
end
