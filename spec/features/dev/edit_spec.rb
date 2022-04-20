require 'rails_helper'

RSpec.describe 'User edit page' do
  it "is linked to from the developer show page" do

    visit developer_path
    click_on 'edit profile'

    expect(current_path).to eq(developers_edit_path)
  end

  it "has a form with name, email, github, and linkedIn fields" do
    visit developers_edit_path
    expect(page).to have_content('Github')
    expect(page).to have_content('LinkedIn')
  end

  it "when the form is filled out with valid data a new user is created on the
  back end and I am redirected to the user show page" do
    visit developers_edit_path
    fill_in 'Github', with: 'cb'
    fill_in 'LinkedIn', with: 'hire me'
    click_on 'Submit'

    developer = DeveloperService.get_user('cb@gmail.com')
    expect(user.github).to eq('cb')
    expect(user.linkedin).to eq('hire me')
    expect(current_path).to eq(developer_path)
  end
end
