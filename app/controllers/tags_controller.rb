class TagsController < ApplicationController
  before_action :must_sign_in

  # 新建
  def create
    render_resource Tag.create create_params
  end

  # 删除
  def destroy
    tag = Tag.find(params[:id])
    head tag.destroy ? :ok : :bad_request
  end

  # 查询所有
  def index
    render_resources Tag.page(params[:page])
  end

  def show
    render_resource Tag.find(params[:id])
  end

  def update
    # 查找
    tag = Tag.find(params[:id])
    # 更新
    tag.update create_params
    # 更新之后有可能成功,有可能失败, 需要 render
    render_resource tag
  end


  private

  def create_params
    # permit 允许
    params.permit(:name)
  end
end
