require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do

    it 'is valid with valid attributes' do
      user = User.new(name: 'Alex', email: 'alex@example.com',
                      password: 'password123', password_confirmation: 'password123')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(email: 'alex@example.com', password: 'password123',
                      password_confirmation: 'password123')
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name: 'Alex', password: 'password123',
                      password_confirmation: 'password123')
      expect(user).to_not be_valid
    end

    it 'is not valid with a duplicate email' do
      User.create(name: 'Alex', email: 'alex@example.com',
                  password: 'password123', password_confirmation: 'password123')
      user = User.new(name: 'Jane Doe', email: 'alex@example.com',
                      password: 'password123', password_confirmation: 'password123')
      expect(user).to_not be_valid
    end

    it 'is not valid with a password less than 8 characters' do
      user = User.new(name: 'Alex', email: 'alex@example.com',
                      password: '1234567', password_confirmation: '1234567')
      expect(user).to_not be_valid
    end

    it 'is not valid without a password confirmation' do
      user = User.new(name: 'Alex', email: 'alex@example.com',
                      password: 'password123')
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.create(name: 'Alex', email: 'alex@example.com',
                          password: 'password123', password_confirmation: 'password123')
    end

    it 'returns a user object if authentication is successful' do
      expect(User.authenticate_with_credentials('alex@example.com', 'password123')).to eq(@user)
    end

    it 'returns nil if authentication is not successful' do
      expect(User.authenticate_with_credentials('alex@example.com', 'incorrectpassword')).to be_nil
    end

    it 'ignores whitespaces in email input' do
      expect(User.authenticate_with_credentials('   alex@example.com   ', 'password123')).to eq(@user)
    end

    it 'ignores case sensitivity in email input' do
      expect(User.authenticate_with_credentials('aLeX@eXampLe.com', 'password123')).to eq(@user)
    end
  end
end
