class RecordsController < ApplicationController
  # 所有的 public 方法都是 action
  before_action :must_sign_in

  def create
    render_resource Record.create create_params
  end

  # 所有的
  def index
    render_resources Record.page(params[:page])
  end

  def show
    render_resource Record.find(params[:id])
  end

  def update
    record = Record.find(params[:id])
    record.update create_params

    # 更新之后有可能成功,有可能失败, 需要 render
    render_resource record
  end

  def destroy
    record = Record.find params[:id]
    head record.destroy ? :ok : :bad_request
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
