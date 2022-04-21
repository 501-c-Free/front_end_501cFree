class Project
  attr_reader :project_id, :project_name, :description, :charity_id, :charity_name

  def initialize(data)
    @project_id = data[:id]
    @project_name = data[:attributes][:project_name]
    @description = data[:attributes][:description]
    @charity_id = data[:attributes][:non_profit][:charity_id]
    @charity_name = data[:attributes][:non_profit][:charity_name]
  end
end