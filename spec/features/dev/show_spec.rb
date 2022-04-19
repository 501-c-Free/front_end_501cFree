require 'rails_helper'

RSpec.describe 'Developer Show page' do
  describe 'features' do
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


end
