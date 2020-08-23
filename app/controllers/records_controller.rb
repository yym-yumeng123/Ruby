class RecordsController < ApplicationController
  # 所有的 public 方法都是 action
  before_action :must_sign_in

  def create
    render_resource Record.create create_params
  end

  def show
    render_resource Record.find(params[:id])
  end

  def destroy
    record = Record.find params[:id]
    head record.destroy ? :ok : :bad_request
  end

  # 所有的
  def index
    render_resources Record.page(params[:page])
  end

  # 下面的都是私有方法
  private

  def render_resources(resources)
    render json: {resources: resources}
  end

  def  create_params
    params.permit(:amount, :category, :notes)
  end

end
