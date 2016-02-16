require 'rails_helper'

feature 'Add Zip Code' do
	let!(:user) 				{ FactoryGirl.create(:user) }

	before do 
		visit dashboards_path

		fill_in 'Email', with: user.email
		fill_in 'Password', with: 'password'
		click_button 'Log in'

		expect(page).to have_content('Track User Progress')
		page.find(".rowlink").click
	end

	scenario 'User logs in and successfully adds zip code to table', js: true do
		VCR.use_cassette("search", :record => :new_episodes) do
			fill_in 'Zip Code', with: '92648'
			click_button 'Add Marker'

			expect(page).to have_content("LOCATION ADDED!")
			expect(page).to have_content("Huntington Beach")
		end
	end

	scenario 'User logs in and unsuccessfully adds zip code to table', js: true do
		fill_in 'Zip Code', with: '11111'
		click_button 'Add Marker'

		expect(page).to have_content("WHOOPS SOMETHING WENT WRONG, CHECK YOUR ZIP CODE")
	end

	scenario 'User logs in and submits with no params', js: true do
		click_button 'Add Marker'

		expect(page).to have_content("WHOOPS SOMETHING WENT WRONG, CHECK YOUR ZIP CODE")
	end
end