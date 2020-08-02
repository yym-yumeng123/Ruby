class UsersController < ApplicationController
  def create
    render_resource User.create create_params
  end

  def create_params
    params.permit(:email, :password, :password_confirmation)
  end

  def me
    user_id = session[:current_user_id]
    user = User.find user_id
    p '--------------------'
    p user
    render_resource user
  end
end
