1. `bin/rails g model tag`
2. `bin/rails db:migrate`  =>  development 环境
3. 写`model`测试
4. `rails db:migrate RAILS_ENV=test`  测试环境

5. 开始创建 `tag controller`, `bin/rails g controller tags`

6. 写测试 `新建 /tags`, 去 `tags_controller.rb 和 routes.rb` 创建对应路由

7. 写文档