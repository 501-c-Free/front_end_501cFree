require 'rails_helper'

RSpec.describe 'Developer Show page' do
  describe 'endpoint' do
    it "returns a developers info" do
      developer_response = {
        id: 1,
        data: {
          attributes: {
            name: 'Anyone',
            email: 'any@mail.com',
            type_of_user: 'developer',
            github: nil,
            linkedin: nil,
          }
        }
      }.to_json

      stub_request(:get, "http:///api/v1/get_developer/1").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v2.2.0'
          }).
        to_return(status: 200, body: "", headers: {})

      # stub_request(:get, 'http://api/v1/get_developer/1')
      # .to_return(status: 200, body: developer_response)

      visit "/developer"

      expect(response.body).to include('Anyone')
    end
  end
  describe 'features' do
    it "There is a list of projects that need developers" do
      visit developer_path

      expect(page).to have_content()
      expect(page).to_not have_content()
    end

    it "each project has a description and a link to its show page" do
      visit developer_path
      project = ProjectFacade.get_project(1)
      expect(page).to have_content()
      click_on "#{project.name}"
      expect(current_path).to eq(project_path(project))
    end

    it "has an edit profile button that links to the dev edit page" do
      visit developer_path
      click_on 'Edit Profile'
      expect(current_path).to eq(developer_edit_path)
    end
  end


end
