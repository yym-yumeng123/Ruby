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

`attr_accessor :email` 做了什么
- 声明一个对象的属性 @email
- def email ==> 获取 @email 的值
- def email = 赋值给 @email
- self.user 就可以使用 @user


---

### 记住密码(思路)
不把密码放在任何地方,  应该存取一个随机数, 有效时间一周或两周

1. 用户登录时勾选了 记住密码
2. server 接受到一个值为 true
3. 如果为 true, 下发一个随机数(存在数据库, 有过期时间)
4. user 就带有了 随机数
5. 下次用户访问, server 端对比随机数 是否是之前的随机数, 如果是, 直接登录


### Bug
1. `BCrypt::Errors::InvalidHash (invalid hash):`
   这意味着存储在 password_digest中的哈希不是有效的BCrypt哈希