class DeveloperService
  def self.connect
    Faraday.new(url: 'http://localhost:3000/api/v1')
  end

  def self.create_dev(data)
    response connect.post('/developers/create') do |req|
      req.params['email'] = data[:email]
      req.params['linkedin'] = data[:linkedin]
      req.params['github'] = data[:github]
    end
  end

  def self.get_merchant(email)
    response = connect.get("api/v1/merchants?#{email}")
    attrs = JSON.parse(response.body, symbolize_names: true)
  end
end
