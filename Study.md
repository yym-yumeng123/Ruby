## 登录 sessions
- 登录只保存状态, 不需要数据库


1. `ActiveRecord` 就是 `Rails` 封装的 `ORM`, 表示数据库里的记录, `User(注册)` 继承了 `ActiveRecord` ,因此 `User` 是数据库里的表, `user1` 是记录
2. `ActiveModel` 是轻量级的 `ActiveRecord` , 不存在数据库里
   ```ruby
   class Session
     include ActiveModel::Model
     attr_accessor :email, :password
   end
   ```
   
   
---

**一个新的类, 例 Sessions,**
1. 先注册路由
```ruby
# routes.rb

Rails.application.routes.draw do
  # 登录 只有生成和破坏
  resources :sessions, only: [:create, :destroy]
end
```

2. 创建 Model
```ruby
# models/session.rb

class Session
  # 使用 ActiveModel
  include ActiveModel::Model
  attr_accessor :email, :password

  # 验证
  validates :email, presence: true
  validates :password, presence: true
  validates_format_of :email,  with: /.+@.+/, if: :email
  validates_length_of :password, minimum: 6, if: :password
end
```

3. Controller
```ruby
# controller 一般 加 s
# bin/rails g controller sessions


class SessionsController < ApplicationController
  def create
  end

  def destroy
  end
end
```

---

## 登录自定义校验
1. validate
```ruby
class Session
  include ActiveModel::Model
  attr_accessor :email, :password

  # validate 方法名 就简单判断
  validate :check_email, if: :email
  validate :email_password_match, if: Proc.new { |s| s.email.present? and s.password.present? }

  # 方法 在某种条件下 对 errors 进行 add
  def check_email
    user = User.find_by email: email
    if user.nil?
      errors.add :email, :not_found
    end
  end
end
```
