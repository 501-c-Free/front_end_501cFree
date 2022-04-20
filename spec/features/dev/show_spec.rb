require 'rails_helper'

RSpec.describe 'Developer Show page' do
  describe 'endpoint' do
    let!(:user) {user = User.new({id: 1, attributes: {name: 'Tester',email: 'fake@user.com'}})}
    it "returns a developers info" do
      developer_response = File.read('spec/fixtures/developer_response.json')
      stub_request(:get, "#{ENV['env_url']}/api/v1/developer/", user.id)
      .with(headers: {developer_id: 1})
      .to_return(status: 200, body: developer_response)
      project_response = File.read('spec/fixtures/project_response.json')
      stub_request(:get, "http://localhost:3000/api/v1/developer/:id/projects")
      .to_return(status: 200, body: project_response)

      dev_response = JSON.parse(developer_response)
      proj_response = JSON.parse(project_response)
      visit "/developer"
      expect(dev_response.status).to be(200)
      expect(dev_response.body).to include('Anyone')
    end
  end
  describe 'features' do
    xit "There is a list of projects that the developer" do
      visit developer_path

      expect(page).to have_content()
      expect(page).to_not have_content()
    end

    xit "each project has a description and a link to its show page" do
      visit developer_path
      project = ProjectFacade.get_project(1)
      expect(page).to have_content()
      click_on "#{project.name}"
      expect(current_path).to eq(project_path(project))
    end

    xit "has an edit profile button that links to the dev edit page" do
      visit developer_path
      click_on 'Edit Profile'
      expect(current_path).to eq(developer_edit_path)
    end
  end


end
