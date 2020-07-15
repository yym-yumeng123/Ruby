# Lamada 表达式

require 'rack'
require 'webrick'

rackApp = -> (env) {
  response = Rack::Response.new
  response.status = 200
  response.headers['Content-Type'] = 'text/html;charset=utf-8'
  response.body = ['<h1>Hello</h1>']
  [response.status, response.headers, response.body]
}

Rack::Handler::WEBrick.run rackApp, Host: '0.0.0.0', Port: 1234