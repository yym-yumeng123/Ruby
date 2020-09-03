class Tagging < ApplicationRecord
  # 关联属于
  belongs_to :tag
  belongs_to :record
  validates_presence_of :record_id, :tag_id
end
