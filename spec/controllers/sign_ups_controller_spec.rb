require 'rails_helper'

RSpec.describe SignUpsController, :type => :controller do

	describe 'GET new' do
    subject { get :new }
    it 'returns http success' do
      subject
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create' do
    context 'valid' do
      subject { post :create, user: { first_name: 'jared', last_name: 'gray', email: 'jared@gray.com', password: 'password', password_confirmation: 'password' } }
      it 'redirects' do
        subject
        expect(response).to redirect_to(dashboards_path)
      end
      it 'signs in the new user' do
        subject
        expect(controller.current_user.email).to eq 'jared@gray.com'
      end
    end

    context 'invalid' do
      subject { post :create, user: { first_name: 'jared', last_name: 'gray', email: 'jared@gray.com', password: 'password', password_confirmation: 'password1' } }
      it 'returns success without flash' do
        subject
        expect(response).to have_http_status(:success)
        expect(flash[:notice]).to be_blank
      end
      it 'should not sign in any user' do
        subject
        expect(controller.current_user).to be_blank
      end
    end
  end
end