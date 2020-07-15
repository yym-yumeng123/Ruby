# 类的写法

require 'rack'
require 'webrick'

class RackApp
  def call(env)
    request = Rack::Request.new(env)

    case request.path
    when '/index.html'
      [
          # 响应
          200,
          {'Content-Type'=> 'text/html;charset=utf-8'},
          ['<link rel="stylesheet" href="style.css"><h1>首页</h1>']
      ]
    when '/style.css'
      [
          # 响应
          200,
          {'Content-Type'=> 'text/css;charset=utf-8'},
          ['h1{color: red}']
      ]
    else
      [
          # 响应
          404,
          {'Content-Type'=> 'text/html;charset=utf-8'},
          ['<div>路径不存在</div>']
      ]

    end

  end
end

# run 后面接受三个参数

Rack::Handler::WEBrick.run RackApp.new, Host: '0.0.0.0', Port: 1234