class DeveloperFacade
  def self.get_developer(user)
    binding.pry
    json = DeveloperService.get_developer(user)
    Developer.new(json[:data])
  end
end
