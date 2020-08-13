# Rails

Rails 的依赖 -- Rack

功能
- 提供非常就简单的 API
- 封装了 HTTP request 和 HTTP response
- 提出了中间件模型

Rack 提供了中间件模型
- 啥是中间件
   - 用户请求之后, 服务器响应之前
 
- 中间件模型
   - Rack 模仿`管道 pipe` 实现了自己的中间件模型
   - 也就是把 req 和 res 一次传给不同的类, 得到不同的结果
   
Rack 和 Rails 的区别
- Rack 只是对请求和响应进行了简单封装
- Rails 包含了你需要的一切功能, 所以很难短时间学会
- Rails 使用 Rack 来处理 HTTP

---


```
# 不下载文档
gem: "--no-document"
```

gem 是什么
- 类似于 Node 的 npm
- gem install 用于全局安装依赖
- 局部安装依赖可以用 bundle install

1.
```cassandraql
rails new morney-rails-1 --database=postgresql --skip-action-mailbox --skip-action-text --skip-sprockets --skip-javascript --skip-turboli
nks --skip-system-test --skip-test --api --skip-webpack-install
```

所有的一切从路由开始

---

window docker 命令

设置镜像, 加速下载  [docker加速器](http://guide.daocloud.io/dcs/daocloud-9153151.html)
```cassandraql
docker run -v morney-rails-1-data:/var/lib/postgresql/data -p 5001:5432 -e POSTGRES_USER=yym -e POSTGRES_PASSWORD=123456 -d postgres:12.2

```
- window 用户只能写文件名, 其他mac等写绝对路径
- `/var/lib/postgresql/data` 默认数据库绝对路径 映射到目录里面
- `-p` 端口
- `-e` 环境变量  用户名 密码
- `-d`  运行保持 守护进程
- `postgres:12.2` 数据库版本

docker 常用命令
- `docker ps -a`  查看运行容器
- `docker kill xxxx`  关闭 id 为 xxxx 的容器
- `docker restart xxxx` 重启刚才关闭的容器
- `docker rm xxxx` 删除容器
- `docker container prune` 删除无用容器 , 以节省控件

```cassandraql
bin/rails db:create   创建数据库
```

---

### 开启数据库
第一次开启数据库
```bash
docker run -v morney-rails-1-data:/var/lib/postgresql/data -p 5001:5432 -e POSTGRES_USER=yym -e POSTGRES_PASSWORD=123456 -d postgres:12.2
```
如果你曾经开启过
```bash
docker ps -a
找到上次的容器
docker restart 容器id
```

其中
- morney-rails-1-data 是数据库目录名，可以替换为任意目录名，也可以替换为绝对路径
- 5001 是数据库服务端口名，可以随意替换，但要确保 database.yml 也作对应修改
- POSTGRES_USER=fang 是用户名，可以随意替换，但要确保 database.yml 也作对应修改
- POSTGRES_PASSWORD=123456 是密码，可以随意替换，但要确保 database.yml 也作对应修改

### 配置 database.yml 

路径: `config/datavase.yml`

1. `Mac / Linux / Docker for Windows` 用户，请将 database.yml 中的 hosts 替换为 localhost
2. `Docker Toolbox for Windows` 用户，请将 database.yml 中的 hosts 替换为 docker-machine ip 的结果

### 创建数据库
```bash
bin/rails db:migrate
```

### 运行 server
```bash
bin/rails s # server
```

### 使用 rspec-rails 测试并称生成文档

- [rspec-rails](https://github.com/rspec/rspec-rails)
- [rspec_api_documentation](https://github.com/zipmark/rspec_api_documentation)
```bash
bin/rake docs:generate
start doc/api/index.html 或者 open doc/api/index.html
```

### 运行一个测试

```bash
bin/rspec -e 'should create a record'
```