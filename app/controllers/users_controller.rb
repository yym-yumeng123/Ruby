class UsersController < ApplicationController
  def create
    p params[:email]
    p '1212'
    user = User.new
    user.email = params[:email]
    user.password = params[:password]
    user.password_confirmation = params[:password_confirmation]
    user.save
    p user.errors
  end
end
