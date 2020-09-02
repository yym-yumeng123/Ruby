class TagsController < ApplicationController
  before_action :must_sign_in

  def create
    render_resource Tag.create create_params
  end

  def destroy
    tag = Tag.find(params[:id])
    head tag.destroy ? :ok : :bad_request
  end


  private

  def create_params
    # permit 允许
    params.permit(:name)
  end
end
