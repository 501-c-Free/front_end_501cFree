class NonProfitService
  def self.connect
    Faraday.new(url: 'http://localhost:3000')
  end

  def self.charity_info(ein, current_user)
    response = connect.post('/api/v1/non_profits/') do |req|
      req.params['ein'] = ein
      req.params['current_user'] = current_user
    end
    return JSON.parse(response.body, symbolize_names: true)
  end
end