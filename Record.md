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
- 创建 `spec/request/record_request_spec.rb`