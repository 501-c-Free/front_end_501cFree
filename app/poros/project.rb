class Project
  attr_reader :id, :project_name, :description

  def initialize(data)
    @id = data[:id]
    @project_name = data[:attributes][:project_name]
    @description = data[:attributes][:description]
  end
end
