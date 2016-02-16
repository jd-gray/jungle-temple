require 'rails_helper'

feature 'Sign Up' do
  
  before do
    visit new_sign_up_path
  end

  scenario 'User signs up for account', js: true do
    expect(page).to have_content('Create User Account')
    expect(page).to have_content('Plot Your Course')
    expect(page).to have_content('Navigate Efficiently')

    fill_in 'First name', with: 'Cristiano'
    fill_in 'Last name', with: 'Ronaldo'
    fill_in 'Email', with: 'cr7@realmadrid.com'
    fill_in 'Password', with: 'password', match: :prefer_exact
    fill_in 'Confirm Password', with: 'password', match: :prefer_exact

    click_button 'Sign up'

    expect(page.current_path).to eq dashboards_path
  end

  scenario 'User incorrectly signs up', js: true do
    expect(page).to have_content('Create User Account')
    expect(page).to have_content('Plot Your Course')
    expect(page).to have_content('Navigate Efficiently')

    fill_in 'First name', with: 'Cristiano'
    fill_in 'Last name', with: 'Ronaldo'
    fill_in 'Email', with: 'cr7@realmadrid.com'
    fill_in 'Password', with: 'password', match: :prefer_exact
    fill_in 'Confirm Password', with: 'password1', match: :prefer_exact

    click_button 'Sign up'

    expect(page).to have_content("YOUR ACCOUNT COULD NOT BE CREATED :(")
  end

  scenario 'User does not submit any params', js: true do
    click_button 'Sign up'
    expect(page).to have_content("YOUR ACCOUNT COULD NOT BE CREATED :(")
  end
end
