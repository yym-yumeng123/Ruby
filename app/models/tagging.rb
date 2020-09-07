class Tagging < ApplicationRecord
  # 关联属于
  belongs_to :tag, required: true
  belongs_to :record, required: true
end
