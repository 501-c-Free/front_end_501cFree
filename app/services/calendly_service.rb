class CalendlyService
  def self.connect
    Faraday.new(url: "https://auth.calendly.com/")
  end

  def self.get_access_token(code)
    response = connect.post('/oauth/token') do |req|
      req.body = {
        'client_id' => ENV['calendly_client_id'],
        'code' => code,
        'redirect_uri' => ENV['env_redirect'],
        'grant_type' => 'authorization_code',
        }
    end
    data = JSON.parse(response.body, symbolize_names: true)
    put "Data 1: #{data}"
    access_token = data[:access_token]
  end

  def self.get_calendar(code)
    access_token = get_access_token(code)
    puts "Access Token #{access_token}"
    conn = Faraday.new(
      url: 'https://api.calendly.com',
      headers: {
        'Authorization': "Bearer #{access_token}"
      }
    )
    response = conn.get('/users/me')
    puts "Conn: #{conn}"
    data = JSON.parse(response.body, symbolize_names: true)
    puts "Data 2: #{data}"
    # @slug = data[:resource][:slug]
  end
end
