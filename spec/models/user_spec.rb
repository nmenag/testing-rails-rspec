# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

	context 'validations' do
		it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_length_of(:name).is_at_most(30) }
		it { should validate_presence_of :email }
		subject { FactoryGirl.build(:user) }
			it { should validate_uniqueness_of(:email) }
		it { should should_not allow_value(Faker::Internet.user_name).for(:email) }
	end

	it 'has a valid factory' do
		expect(build(:user)).to be_valid
	end
end
