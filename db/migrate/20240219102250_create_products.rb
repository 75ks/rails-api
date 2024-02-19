class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :prod_name    # 商品名
      t.string :model_no     # 型番
      t.decimal :cost, precision: 9, scale: 2  # 標準単価
      t.decimal :discount, precision: 9, scale: 2  # 限界割引率

      t.timestamps
    end
  end
end
