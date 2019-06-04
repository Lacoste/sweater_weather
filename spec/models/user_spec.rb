# require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe 'Relationships' do
    it { should have_many :favorites }
  end

  describe 'Instance Methods' do
    context '#generate_api_key' do
      it 'generates an api_key for a user' do
        user = User.create(email: "whatever@example.com",
                           password: "password",
                           password_confirmation: "password"
                          )

        expect(user.api_key.present?).to eq(false)

        user.generate_api_key

        expect(user.api_key.present?).to eq(true)
        expect(user.api_key.class).to eq(String)
      end
    end
  end
end
