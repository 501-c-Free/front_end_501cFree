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

  def self.get_user_charity(current_user)
    response = connect.get("/api/v1/non_profits/#{current_user}")
    return JSON.parse(response.body, symbolize_names: true)

  end
end
