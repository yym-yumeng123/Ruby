# 类的写法

require 'rack'
require 'webrick'

class RackApp
  def call(env)
    [
        # 响应
        200,
        {'Content-Type'=> 'text/html;charset=utf-8'},
        ['<div>你好</div>']
    ]
  end
end

# run 后面接受三个参数
Rack::Handler::WEBrick.run RackApp.new, Host: '0.0.0.0', Port: 1234