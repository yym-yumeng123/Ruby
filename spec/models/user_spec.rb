require 'rails_helper'

RSpec.describe User, type: :model do
  it '可以带密码创建' do
    user = User.create email: '11@qq.com', password: '123456', password_confirmation: '123456'
    expect(user.password_digest).to_not eq '123456'
    expect(user.id).to be_a Numeric
  end
end
