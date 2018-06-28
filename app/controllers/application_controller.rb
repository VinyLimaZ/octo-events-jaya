class ApplicationController < ActionController::API
  include GithubTokenAuth
  include ExceptionHelper

  rescue_from SecurityError, with: :signature_mismatch!
end
