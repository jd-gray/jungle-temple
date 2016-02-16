require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
  	it { should validate_presence_of(:first_name) }
  	it { should validate_presence_of(:last_name) }
  	it { should validate_presence_of(:email) }
  	it { should allow_value('jared@jared-gray.com').for(:email) }
  	it { should_not allow_value('jared@jared-gray').for(:email) }

  	it "should have a valid factory" do 
  		FactoryGirl.build(:user)
  	end
  end

  describe '#full_name' do 
  	let!(:user) { FactoryGirl.create(:user, first_name: 'Cristiano', last_name: 'Ronaldo') }
  	subject { user.full_name }

  	it 'returns full name of user' do
  		expect(subject).to eq "Cristiano Ronaldo"
  	end
  end

end
