require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'It should have multiple recipes associated with it' do
      expect(User.reflect_on_association(:recipes).macro).to eq(:has_many)
    end
    it 'It should have multiple foods associated with it' do
      expect(User.reflect_on_association(:foods).macro).to eq(:has_many)
    end
  end
end
