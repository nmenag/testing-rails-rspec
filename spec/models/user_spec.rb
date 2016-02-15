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
	context 'has invalid factory' do 
		it 'without name' do
			expect(build(:user, name: nil)).not_to be_valid
		end

		it 'when name have less than of three words' do
			expect(build(:user, name: Faker::Lorem.characters(2))).not_to be_valid
		end

		it 'when name have more than of thirty words' do
			expect(build(:user, name: Faker::Lorem.characters(31))).not_to be_valid
		end

		it 'without email' do
			expect(build(:user, email: nil)).not_to be_valid
		end

		it 'when email address is already taken' do
			user = create(:user) #using factory girl
			expect(build(:user, email: user.email)).not_to be_valid
		end

		it 'when email address is not format Permitted' do
			expect(build(:user, email: Faker::Lorem.word)).not_to be_valid
		end
	end
		
	it 'has a valid factory' do 
		expect(build(:user)).to be_valid
	end 
end
