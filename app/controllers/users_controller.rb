class UsersController < ApplicationController
  def create
    user = User.create create_params
    render_resource user
    UserMailer.with(user: user).welcome_email.deliver_now
  end

  def create_params
    params.permit(:email, :password, :password_confirmation)
  end
end
