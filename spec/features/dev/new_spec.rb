require 'rails_helper'

RSpec.describe 'New developer page' do
  let!(:user) {user = User.new({attributes: {name: 'Tester',email: 'fake@user.com'}})}

  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.silence_get_warning = true
    OmniAuth.config.add_mock(:google, {:uid => '12345'})
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)
  end

  it "is linked to from the user choice page" do
    stub_omniauth
    visit root_path
    click_on 'Sign Up'
    expect(current_path).to eq(user_choice_path)
  end


  it 'logs in' do
    stub_omniauth
    visit root_path
    click_on 'Log In'
    expect(current_path).to eq(user_choice_path)
  end

  xit "has a form with name, email, github, and linkedIn fields" do

    visit developers_new_path
    expect(page).to have_content('Github')
    expect(page).to have_content('LinkedIn')
  end

  xit "when the form is filled out with valid data a new user is created on the
  back end and I am redirected to the user show page" do
    visit developers_new_path
    fill_in 'Github', with: 'cb'
    fill_in 'LinkedIn', with: 'hire me'
    click_on 'Submit'

    developer = DeveloperService.get_user('cb@gmail.com')
    expect(user.github).to eq('cb')
    expect(user.linkedin).to eq('hire me')
    expect(current_path).to eq(developer_path)
  end
end
