# 记录

### 创建记录

1. 创建 Model
   ```bash
   bin/rails g model record
   等同于
   bin/rails generate model record
   ```

2. 生成 `db/migrate/时间戳_create_records.rb` 数据

   - 添加对应的字段, 例如: `amount` 金额, `notes` 备注

3. 命令
   ```bash
   数据库就会含有对应字段的表
   bin/rails db:migrate
   ```
   - 查看 `schame.rb` 是否 `records` 是否成功执行

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
   ```bash
    执行 rspec
   bin/rspec  # 执行所有 rspec
   bin/rspec -e "描述"  # 执行一个
   ```
   错误1: 没有路由
   ```ruby
   # routes.rb
   resources :records
   #  POST   /records(.:format)  records#create
   ```
   错误2: 没有 `/posts`
   - 新建 `controller`
   ```bash
    bin/rails g controller records # 复数   
   ```
   - 创建了 `records_controller.rb`, 自动创建了 `records_request_spec.rb`
   - 之前创建了, 就不用覆盖了
   
   
5. `records_controller.rb` (对应上4)

   ```ruby
    class RecordsController < ApplicationController
      # 创建
      def create
      
      end
    end
    ```
 
 6. 继续测试 `models/record_spec.rb`
```ruby
# amount 不能为空
# model/record.rb
class Record < ApplicationRecord
  validates_presence_of :amount, :category
end 
```

7. 汉化
- `config/locales/zh-CN.yml`


![:limit](./app/assets/images/limit.png)