class ApplicationController < ActionController::API
  include ActionController::Cookies

  def authorize
    return render json: {errors: ["Not Authorized"]}, status: :unauthorized unless session.include? :user_id
  end

end
