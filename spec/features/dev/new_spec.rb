require 'rails_helper'

RSpec.describe 'New developer page' do
  it "is linked to from the user choice page" do
    visit
    click_on 'Sign up as a developer'
    expect(current_path).to eq(developers_new_path)
  end

  it "has a form with name, email, github, and linkedIn fields" do
    visit developers_new_path
    expect(page).to have_content('Name')
    expect(page).to have_content('Email')
    expect(page).to have_content('Github')
    expect(page).to have_content('LinkedIn')
  end

  it "when the form is filled out with valid data a new user is created on the
  back end and I am redirected to the user show page" do
    visit developers_new_path
    fill_in 'Name', with: 'Conor'
    fill_in 'Email', with: 'cb@gmail.com'
    fill_in 'Github', with: 'cb'
    fill_in 'LinkedIn', with: 'hire me'

    developer = DeveloperFacade.get_user('cb@gmail.com')
    expect(user.name).to eq('Conor')
    expect(user.email).to eq('cb@gmail.com')
    expect(user.github).to eq('cb')
    expect(user.linkedin).to eq('hire me')
    expect(current_path).to eq(developer_path)
  end
end
