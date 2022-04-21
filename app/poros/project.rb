require_relative './project_developer'

class Project
  attr_reader :project_id, :project_name, :description, :charity_id, :charity_name, :developers, :owner_id, :developers

  def initialize(data)
    @project_id = data[:id]
    @project_name = data[:attributes][:project_name]
    @description = data[:attributes][:description]
    @charity_id = data[:attributes][:non_profit][:charity_id]
    @charity_name = data[:attributes][:non_profit][:charity_name]
    @developers = make_developers(data[:attributes][:developers])
    @owner_id = data[:attributes][:project_owner][:user]
  end

  def make_developers(developers)
    developers = developers.map do |developer|
      ProjectDeveloper.new(developer)
    end
    return developers
  end
end