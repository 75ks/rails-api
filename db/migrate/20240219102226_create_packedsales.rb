class CreatePackedsales < ActiveRecord::Migration[7.1]
  def change
    create_table :packedsales do |t|
      t.integer :psales_no      # 売上NO
      t.date :psales_date       # 売上日付
      t.integer :emp_id         # 担当者ID
      t.integer :cust_id        # 顧客ID
      t.string :cust_address    # 届け先住所
      t.string :cust_tel        # 届け先電話番号
      t.date :delivery_date     # 届け予定日
      t.time :delivery_time     # 届け予定時刻
      t.decimal :total, precision: 9, scale: 2  # 売上合計金額
      t.decimal :carriage, precision: 9, scale: 2  # 送料
      t.decimal :excise, precision: 9, scale: 2    # 消費税額

      t.timestamps
    end

    add_index :packedsales, :psales_no, unique: true  # psales_noを一意のインデックスとして追加
  end
end
