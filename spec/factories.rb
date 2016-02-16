require 'ffaker'

FactoryGirl.define do
	factory :user do
		first_name Faker::Name.first_name
		last_name Faker::Name.last_name
		sequence(:email) { |n| "user_#{n}@example.com" }
		password 'password'
	end
end