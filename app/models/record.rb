class Record < ApplicationRecord
  # 我拥有很多从属, 属于taggings
  has_many :taggings
  has_many :tags, through: :taggings
  enum category: { outgoings: 1, income: 2 }
  validates_presence_of :amount, :category
end
