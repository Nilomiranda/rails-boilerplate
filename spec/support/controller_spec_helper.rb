module ControllerSpecHelper
  # generates token from user id
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  # generates expired token
  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  # returns valid headers
  def valid_headers
    {
        "Authorization" => token_generator(user.id),
        "Content-Type" => "application/json"
    }
  end

  # returns invalid headers
  def invalid_headers
    {
        "Authorization" => nil,
        "Content-Type" => "application/json"
    }
  end
end
