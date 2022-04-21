class DeveloperFacade
  def self.get_developer(user)
    json = DeveloperService.get_developer(user)
    Developer.new(json[:data])
  end

    def self.get_all_developers
      developers = DeveloperService.get_all_developers[:data].map do |data| 
        Developer.new(data)
      end
    end
end
