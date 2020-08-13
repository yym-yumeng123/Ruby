require 'rails_helper'

RSpec.describe "Record", type: :request do
  it "should create a record" do
    # 金额单位为最小单位 分, 防止浮点数不精确
    # 类型: 支出
    post '/records', params: {amount: 10000, category: 'outgoings', notes: '请客'}
    expect {response.status}.to eq 200
    body = JSON.parse(response.body)
    expect(body["resource"]["id"]).to be
  end
end
