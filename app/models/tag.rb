class Tag < ApplicationRecord
  # name 必填
  validates_presence_of :name
end
