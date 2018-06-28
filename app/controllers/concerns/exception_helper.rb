module ExceptionHelper

  def signature_mismatch!
    render json: { errors: 'Signature mismatch!' }, status: :unauthorized
  end
end
