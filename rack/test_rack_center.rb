require 'rack'
require 'webrick'

app = Rack::Builder.app do
  use Rack::CommonLogger
  run -> (env) {
    [200, {}, ['<h1>Hi</hi>']]
  }
end

Rack::Handler::WEBrick.run app, Host: '0.0.0.0', Port: 1234, AccessLog: []