class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      # 金额 数字 数据库不能为空 null
      t.integer :amount, null: false
      # 类型: 支出 或 收入, limit: 1 ==> smaller 1个字节 127位
      t.integer :category, null: false, limit: 1
      # 备注
      t.string :notes
      t.timestamps
    end
  end
end
