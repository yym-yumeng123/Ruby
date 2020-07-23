class FirstController < ApplicationController
  def hello
    # render plain: 'hello rails'
    # render json: {name: 'yym', age: 12}
    render 'first/hello'
  end
  def hi
    render 'first/hi'
  end

end