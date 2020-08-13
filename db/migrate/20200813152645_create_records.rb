class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      # 金额 数字 不能为空
      t.integer :amount, null: false
      # 类型: 支出 或 收入
      t.integer :category, null: false, limit: 1
      # 备注
      t.string :notes
      t.timestamps
    end
  end
end
