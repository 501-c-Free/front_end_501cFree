class User
  attr_reader :id, :name, :email, :type_of_user

  def initialize(data)
    @name = data[:attributes][:name]
    @email = data[:attributes][:email]
    @type_of_user = data[:attributes][:type_of_user]
  end
end
