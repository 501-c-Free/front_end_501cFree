require 'rails_helper'

RSpec.describe 'NonProfit Registration', type: :feature do
  context 'When I visit root, I see a button to sign up' do
    it 'has a sign up button' do
      visit root_path

      within ('div.container-nav') do
        expect(page).to have_link("Log In")
        expect(page).to have_link("Sign Up")
      end
    end
  end

  let!(:user) {user = User.new({attributes: {name: 'Tester',email: 'fake@user.com'}})}

  context 'NonProfit Makes Account' do
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
    end

    scenario 'lets you decide user type', :vcr do
        expect(page).to have_content("Choose Your User Type")
        within ("div.choice-np") do
          expect(page).to have_content("Non Profit")
          expect(page).to have_link("Sign Up")
          click_on "Sign Up"
        end
        expect(current_path).to eq(new_representative_path)
    end

    scenario 'lets you find your non profit', :vcr do

        expect(page).to have_content("Choose Your User Type")

        within ("div.choice-np") do
          expect(page).to have_content("Non Profit")
          expect(page).to have_link("Sign Up")
          click_on "Sign Up"

        end

        within ("div.search-title") do
          expect(page).to have_content('Search your organization:')
        end

        within ("div.card-body") do
          expect(page).to have_content("Search")
          find(:xpath, '//*[@id="ein"]').set("530196605")
          find(:xpath, "/html/body/div[2]/div/div[2]/form/div/div/input").click
        end
      end
  end
end
