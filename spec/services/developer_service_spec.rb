require 'rails_helper'

RSpec.describe DeveloperService do
  context '#connect' do
    it "returns json response" do
      response = DeveloperService.connect
      expect(response).to be_a Faraday::Connection
    end
  end
end
