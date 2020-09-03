class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      # 引用
      t.references :tag, null: false
      t.references :record, null: false
      t.timestamps
    end
  end
end
