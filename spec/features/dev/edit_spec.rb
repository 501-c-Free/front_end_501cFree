require 'rails_helper'

RSpec.describe 'User edit page' do
  data ={
    id: '6',
      attributes:{
        name: 'Greg Flaherty',
        email: 'gregoryjflaherty@gmail.com',
        github: 'cd',
        linkedin: 'hire me',
        user: {
          user_id: 5
        }
      }
    }

  user = Developer.new(data)
  before(:each) do

    OmniAuth.config.test_mode = true
    OmniAuth.config.silence_get_warning = true
    OmniAuth.config.add_mock(:google, {:uid => '12345'})
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(user)

    stub_omniauth
    visit root_path
    click_on 'Sign Up'
    expect(current_path).to eq(user_choice_path)

    expect(page).to have_content("Choose Your User Type")

    within(:xpath, "/html/body/div[2]/div/div[1]/div") do
      expect(page).to have_content("Developer")
      expect(page).to have_link("Sign Up")
      click_on "Sign Up"
    end
    expect(current_path).to eq(developers_new_path)
  end

  scenario 'developer create', :vcr do
      expect(current_path).to eq(developers_new_path)

      expect(page).to have_content('Github')
      expect(page).to have_content('Linkedin')
      fill_in 'Github', with: 'cb'
      fill_in 'Linkedin', with: 'hire me'

      click_on 'Submit'
      expect(current_path).to eq("/developer/#{user}")
  end
end
#
#   it "has a form with name, email, github, and linkedIn fields" do
#     visit developers_edit_path
#   end
#
  # it "when the form is filled out with valid data a new user is created on the
  # back end and I am redirected to the user show page" do
  #   visit developers_edit_path
  #   developer = DeveloperService.get_user('cb@gmail.com')
  #
  #   expect(user.github).to eq('cb')
  #   expect(user.linkedin).to eq('hire me')
  # end
# end
