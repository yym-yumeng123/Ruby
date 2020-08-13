# 记录

1. 创建 Model
   ```bash
   bin/rails g model record
   等同于
   bin/rails generate model record
   ```

2. 生成 `db/migrate` 数据

   - 添加对应的字段, 例如: `amount` 金额, `notes` 备注

3. 命令
   ```bash
   数据库就会含有对应字段的表
   bin/rails db:migrate
   ```

4. TDD 测试驱动开发
   - 创建 `spec/request/records_request_spec.rb`
   ```ruby
   require 'rails_helper'

   RSpec.describe "Records", type: :request do
     it "should create a record" do
       # 金额单位为最小单位 分, 防止浮点数不精确
       # 类型: 支出
       post '/records', params: {amount: 10000, category: 'outgoings', notes: '请客'}
       expect {response.status}.to eq 200
       body = JSON.parse(response.body)
       expect(body["resource"]["id"]).to be
     end
   end
   ```
   错误1: 没有路由
   ```ruby
   # routes.rb
   resources :records
   ```
