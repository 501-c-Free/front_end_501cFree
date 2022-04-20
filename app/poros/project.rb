class Project
  attr_reader :id, :project_name, :description

  def initialize(data)
    @id = data[:id]
    @project_name = data[:project_name]
    @description = data[:description]
  end
end
