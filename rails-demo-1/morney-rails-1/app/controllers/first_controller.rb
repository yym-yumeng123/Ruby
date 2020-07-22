class FirstController < ApplicationController
  def hello
    # render plain: 'hello rails'
    render json: {name: 'yym', age: 12}
  end
end