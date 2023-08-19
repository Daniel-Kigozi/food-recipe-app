module AuthenticationHelpers
  def sign_in(user)
    post user_session_path, params: { user: { email: user.email, password: 'password' } }
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers, type: :request
end
