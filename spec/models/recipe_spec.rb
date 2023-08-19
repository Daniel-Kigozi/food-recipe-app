require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    @user = User.create(name: 'user')
    @recipe = Recipe.create(name: 'recipe', preparation_time: 1, cooking_time: 2, description: 'description',
                            public: true, user: @user, user_id: 1)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a name of appropriate length' do
    subject.name = 'a'
    expect(subject).to_not be_valid
  end

  it 'should not have a name that is too long' do
    subject.name = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'should not have an empty name' do
    subject.name = ' '
    expect(subject).to_not be_valid
  end

  it 'should have the correct name' do
    expect(subject.name).to eql 'recipe'
  end

  it 'should have a presence of preparation time' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'should have an integer preparation time' do
    expect(subject.preparation_time).to be_an(Integer)
  end

  it 'should not have a preparation time less than 1' do
    subject.preparation_time = -1
    expect(subject).to_not be_valid
  end

  it 'should have a presence of cooking time' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'should have an integer cooking time' do
    expect(subject.cooking_time).to be_an(Integer)
  end

  it 'should not have a cooking time less than 1' do
    subject.cooking_time = -1
    expect(subject).to_not be_valid
  end

  it 'should have a presence of description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'should not have an empty description' do
    subject.description = ' '
    expect(subject).to_not be_valid
  end

  it 'should have a boolean value for public' do
    expect(subject.public).to be(false).or be(true)
  end

  it 'should have the correct public value' do
    expect(subject.public).to eql true
  end
end
