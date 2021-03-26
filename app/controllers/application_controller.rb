class ApplicationController < ActionController::API
  before_action :auth_middleware

  def encode_token(user_id, expires = Time.now + 60 * 60 * 2)
    payload = { user_id: user_id, expires: expires.to_i }
    JWT.encode(payload, Rails.application.credentials[:jwt][:key])
  end

  def decode_token
    if (bearer = request.headers['Authorization'])
      begin
        token = bearer.split(' ')[1]
        JWT.decode(token, Rails.application.credentials[:jwt][:key], true, algorithm: 'HS256')[0]
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def auth_middleware
    render status: :unauthorized, json: { error: I18n.t('user.unauthorized') } if expired?
    render status: :unauthorized, json: { error: I18n.t('user.not_found') } unless logged_in_user?
  end

  private

  def logged_in_user?
    if (payload = decode_token)
      @user = User.find_by(user_id: payload['user_id'])
    end
  end

  def expired?
    if (payload = decode_token)
      Time.at(payload['expires']) < Time.now
    end
  end
end
