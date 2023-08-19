require 'rails_helper'

RSpec.describe 'Log in process', type: :feature do
  let!(:user) { User.create(email: 'user@domain.com', password: 'password') }

  before do
    visit root_path
  end

  it 'displays detailed error with empty credentials' do
    fill_in 'user_email', with: ''
    fill_in 'user_password', with: ''
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'displays error message with invalid credentials' do
    fill_in 'user_email', with: 'user@domain.com'
    fill_in 'user_password', with: 'wrong_password'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'successfully logs in using correct credentials' do
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    expect(page).to have_current_path(user_session_path)
  end
end
