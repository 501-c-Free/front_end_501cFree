class ProjectDeveloper 
    attr_reader :id, :name, :email, :github, :linkedin
    def initialize(data)
        @id = data[:id]
        @name = data[:name]
        @email = data[:email]
        @github = data[:github]
        @linkedin = data[:linkedin]
    end
end