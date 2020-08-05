class ApplicationController < ActionController::API
  def current_user
    # 省略 return
    @current_user ||= User.find_by_id session[:current_user_id]
  end

  def render_resource(resource)
    return head 404 if resource.nil?
    # errors 是 empty
    if resource.errors.empty?
      render json: {resource: resource}, status: 200
    else
      render json: {errors: resource.errors}, status: 422
    end
  end
end
