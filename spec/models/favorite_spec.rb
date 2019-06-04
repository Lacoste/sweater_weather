require 'rails_helper'

describe Favorite, type: :model do
  describe 'Relationships' do
    it { should belong_to :user }
    it { should belong_to :cities }
  end
end
