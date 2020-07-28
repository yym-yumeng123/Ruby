class User < ApplicationRecord
  has_secure_password

  # 验证某些东西的存在
  validates_presence_of :email
  validates_presence_of :password_confirmation, on: [:create]

  validates_format_of :email, with: /.+@.+/, if: :email
  validates_length_of :password, minimum: 6, if: :password
end
