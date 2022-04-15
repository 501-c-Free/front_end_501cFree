class DeveloperService
  def self.connect
    Faraday.new(url: 'http://localhost:3000/')
  end

  def self.get_merchant(email)
    response = connect.get("api/v1/merchants?#{email}")
    attrs = JSON.parse(response.body, symbolize_names: true)
  end
end
