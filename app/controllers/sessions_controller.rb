class SessionsController < ApplicationController
  def create
    # new 不会触发验证
    # render_resource Session.new create_params
    s = Session.new create_params
    s.validate
    render_resource s

    # session[:current_user_id] = session.user.id
  end

  def destroy

  end

  def create_params
    params.permit(:email, :password)
  end
end
