class NonProfitService
  def self.connect
    Faraday.new(url: ENV['env_url'])
  end

  def self.charity_info(ein, current_user)
    response = connect.post('/api/v1/non_profits/') do |req|
      req.params['ein'] = ein
      req.params['current_user'] = current_user
    end
    return JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_user_charity(user)
    response = connect.get("/api/v1/non_profits/#{user}")
    return JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_charity(username, current_user)
    response = connect.patch("/api/v1/non_profits/#{current_user}") do |req|
      req.params['calendly'] = username
    end
    return JSON.parse(response.body, symbolize_names: true)
  end
end
