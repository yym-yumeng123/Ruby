# Lamada 表达式

require 'rack'
require 'webrick'

rackApp = -> (env) {
  [200, {'Content-Type'=> 'text/html;charset=utf-8'}, ['Hello']]
}

Rack::Handler::WEBrick.run rackApp, Host: '0.0.0.0', Port: 1234