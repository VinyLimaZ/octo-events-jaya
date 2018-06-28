module ExceptionHelper

  def signature_mismatch!
    render json: {
      errors: I18n.t('errors.messages.signature_mismatch')
    }, status: :unauthorized
  end

  def not_found_exception!
    render json: { errors: I18n.t('errors.messages.not_found')}, status: :not_found
  end
end
