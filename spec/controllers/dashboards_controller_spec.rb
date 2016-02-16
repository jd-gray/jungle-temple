require 'rails_helper'

describe DashboardsController do 
	let!(:user) { FactoryGirl.create(:user) }

	before do 
		sign_in :user, user
	end

	describe 'GET :index' do
		subject { get :index }
		it { should be_success }

		it 'should paginate users' do
			100.times { FactoryGirl.create(:user) }
			subject
			expect(response).to be_success
			expect { assigns(:users).offset_value }.to_not raise_error
		end
	end
end