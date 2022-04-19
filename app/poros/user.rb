class User
  attr_reader :name, :email

  def initialize(data)
    @name = data[:attributes][:name]
    @email = data[:attributes][:email]
    @email = data[:attributes][:type_of_user]
  end
end
