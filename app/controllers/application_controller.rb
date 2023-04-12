class ApplicationController < ActionController::API
  include ActionController::Cookies

  before_action :authorize
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  def authorize
    @current_user = User.find_by(id: session[:user_id])
    render json: {errors: ["Not authorized"] },status: :unauthorized unless @current_user
  end


  def render_invalid_response(execption)
    render json: { errors: execption.record.errors.full_messages }, status: :unprocessable_entity
  end
end
