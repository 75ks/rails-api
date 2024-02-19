class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.integer :sales_no     # 売上明細NO
      t.integer :psales_no    # 売上NO
      t.integer :prod_id      # 商品ID
      t.decimal :quantity, precision: 9, scale: 2  # 数量
      t.decimal :price, precision: 9, scale: 2     # 売価

      t.timestamps
    end

    add_index :sales, :sales_no, unique: true  # sales_noに一意のインデックスを追加
    add_index :sales, :psales_no               # psales_noにインデックスを追加、関連データの検索を高速化
  end
end
