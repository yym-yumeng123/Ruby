class User < ApplicationRecord
  has_secure_password

  # 验证某些东西的存在
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password_confirmation, on: [:create]

  validates_format_of :email, with: /.+@.+/, if: :email
  validates_length_of :password, minimum: 6, if: :password

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.with(user: self ).welcome_email.deliver_later
  end
end
