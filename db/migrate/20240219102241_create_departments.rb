class CreateDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :departments do |t|
      t.string :dept_name   # 部門名
      t.string :loc         # 場所
      t.integer :mgr_id     # 管理者ID
      t.integer :adept_id   # 管理部門ID

      t.timestamps
    end

    add_index :departments, :mgr_id
    add_index :departments, :adept_id
  end
end
