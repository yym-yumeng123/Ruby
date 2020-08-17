class RecordsController < ApplicationController
  def create
    # 必须登录
    must_sign_in
    render_resource Record.create create_params
  end

  def  create_params
    params.permit(:amount, :category, :notes)
  end

  def destroy
    must_sign_in
    record = Record.find params[:id]
    head record.destroy ? :ok : :bad_request
  end
end
