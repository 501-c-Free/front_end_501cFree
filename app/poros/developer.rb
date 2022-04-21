class Developer
  attr_reader :id, :name, :email, :github, :linkedin, :user_id

  def initialize(data)
    
    @id = data[:id]
    @name = data[:attributes][:name]
    @email = data[:attributes][:email]
    @github = data[:attributes][:github]
    @linkedin = data[:attributes][:linkedin]
    @user_id = data[:attributes][:user][:user_id]
  end
end
