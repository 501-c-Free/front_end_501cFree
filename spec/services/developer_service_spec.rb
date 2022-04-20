require 'rails_helper'

RSpec.describe DeveloperService do
  context '#connect' do
    it "returns json response" do
      response = DeveloperService.connect
      expect(response).to be_a Faraday::Connection
    end
  end
  context '#get_developer' do
    it "returns a users info from the back end database" do
      developer_response = {
        id: 1,
        data: [
          attributes: {
            name: 'Anyone',
            email: 'any@mail.com',
            type_of_user: 'developer',
            github: nil,
            linkedin: nil,
          }
        ]
      }.to_json
      stub_request(:get, 'http://localhost:5000/developer').to_return(status: 200, body: developer_response)
      developer = DeveloperService.get_developer(1)
      expect(developer[:data][:attributes][:name]).to eq('Anyone')
    end
  end
  context '#create_dev' do
    xit "sends a post request to create a user on the back end" do
      stub_request(:post, )
    end

  end
end
