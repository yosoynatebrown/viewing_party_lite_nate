require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it {should have_many :user_viewing_parties}
    it {should have_many(:viewing_parties).through(:user_viewing_parties)}
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest)} 
    it { should have_secure_password}
  end

  it 'uses bcrypt' do
    user = User.create(name: 'Nate', email: 'nate@nate.com', password: 'password456', password_confirmation: 'password456')
    expect(user).to_not have_attribute(:password)
    expect(user.password_digest).to_not eq('password456')
  end

  it 'does not allow non-matching passwords' do
    user = User.create(name: 'Nate', email: 'nate@nate1.com', password: 'password123', password_confirmation: 'password456')
    
    expect(user.id).to eq nil
  end
end