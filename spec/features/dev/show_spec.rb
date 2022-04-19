require 'rails_helper'

RSpec.describe 'New developer page' do
  let!(:user) {@user = User.new({attributes: {user_id: 0, name: 'Tester',email: 'fake@user.com', type_of_user: 'developer'}})}

  before(:each) do
    @fake_user = DeveloperService.create_dev(@user)

    OmniAuth.config.test_mode = true
    OmniAuth.config.silence_get_warning = true
    OmniAuth.config.add_mock(:google, {:uid => '12345'})
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)

    stub_omniauth
    visit root_path
    click_on 'Log In'
  end

  it "log in as developer" do
    expect(current_path).to eq(developer_path)
  end
end
