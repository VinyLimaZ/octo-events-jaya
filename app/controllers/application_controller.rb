class ApplicationController < ActionController::API
  include GithubTokenAuth
  include ExceptionHelper

  rescue_from SecurityError, with: :signature_mismatch!
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_exception!
end
