class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.integer :dept_id      # 部門ID
      t.string :emp_name      # 担当者名
      t.date :birthday        # 生年月日
      t.date :hiredate        # 入社年月日
      t.integer :sex          # 性別 (1: 男性, 2: 女性)
      t.decimal :sal, precision: 9, scale: 2  # 給与額

      t.timestamps
    end
  end
end
