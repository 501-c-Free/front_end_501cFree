class Developer
  attr_reader :id, :name, :email, :github, :linkedin

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @email = data[:attributes][:email]
    @github = data[:attributes][:github]
    @linkedin = data[:attributes][:linkedin]
  end
end
