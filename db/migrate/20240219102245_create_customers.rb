class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :cust_name    # 顧客名
      t.string :address      # 住所
      t.string :tel          # 電話番号
      t.string :fax          # FAX番号

      t.timestamps
    end
  end
end
