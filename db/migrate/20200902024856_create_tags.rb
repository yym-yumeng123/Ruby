class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      # 标签名
      t.string :name, limit: 20
      t.timestamps
    end
  end
end
