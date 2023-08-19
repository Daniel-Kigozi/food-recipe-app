require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    @user = User.create(name: 'Someone')
    @food = Food.create(name: 'Food', measurement_unit: 'grams', price: 15.5, quantity: 10, user: @user, user_id: 1)
  end

  before { subject.save }

  it 'It should have multiple recipe_foods associated with it' do
    expect(Food.reflect_on_association(:recipe_foods).macro).to eq(:has_many)
  end

  it 'It must be associated with a user' do
    expect(Food.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'should not be valid if name is missing' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid if name is empty' do
    subject.name = ' '
    expect(subject).to_not be_valid
  end

  it 'should have the correct name value' do
    expect(subject.name).to eq('Food')
  end

  it 'should have a name of type String' do
    expect(subject.name).to be_a(String)
  end

  it 'should not be valid if measurement unit is missing' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid if price is missing' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid if quantity is missing' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end
end
