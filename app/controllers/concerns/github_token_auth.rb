# frozen_string_literal: true

module GithubTokenAuth
  SECRET_GITHUB_TOKEN = Rails.env['SECRET_GITHUB_TOKEN'] || Rails.application.secrets.secret_github_token

  def verify_github_webhook_token
    unless Rack::Utils.secure_compare(app_sha1_key, github_sha1_key)
      raise SecurityError
    end
  end

  private

  def payload_body
    request.body.read
  end

  def app_sha1_key
    "sha1=#{OpenSSL::HMAC.hexdigest('sha1', SECRET_GITHUB_TOKEN, payload_body)}"
  end

  def github_sha1_key
    request.env['HTTP_X_HUB_SIGNATURE']
  end
end
