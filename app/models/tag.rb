class Tag < ApplicationRecord
  # 我拥有很多从属, 属于taggings
  has_many :taggings
  has_many :records, through: :taggings
  # name 必填
  validates_presence_of :name
end
