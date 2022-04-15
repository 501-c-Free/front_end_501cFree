require 'rails_helper'

RSpec.describe 'User Registration', type: :feature do
  context 'When I visit root, I see a button to sign up' do
    it 'has a sign up button' do
      visit root_path

      within 'div.nav_bar' do
        expect(page).to have_content("501cFree")
        expect(page).to have_link("Sign Up")
      end
    end
  end
end
