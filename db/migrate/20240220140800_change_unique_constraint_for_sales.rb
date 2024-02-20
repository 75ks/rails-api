class ChangeUniqueConstraintForSales < ActiveRecord::Migration[7.1]
  def change
    # 既存の一意制約を削除（もし`sales_no`に適用されている場合）
    remove_index :sales, :sales_no, unique: true if index_exists?(:sales, :sales_no, unique: true)
    
    # sales_noとpsales_noの組み合わせで一意制約を追加
    add_index :sales, [:sales_no, :psales_no], unique: true
  end
end
