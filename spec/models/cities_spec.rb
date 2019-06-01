require 'rails_helper'

describe Cities, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :latitude}
    it {should validate_presence_of :longitude}
  end
end
