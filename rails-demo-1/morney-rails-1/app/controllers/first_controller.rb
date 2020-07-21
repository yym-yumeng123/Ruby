class FirstController < ApplicationController
  def hello
    render plain: 'hello'
  end
end