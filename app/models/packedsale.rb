class Packedsale < ApplicationRecord
  has_many :sales, primary_key: :psales_no, foreign_key: :psales_no

  def self.with_sales
    joins(:sales).select(<<-SQL
      packedsales.id,
      packedsales.psales_no,
      packedsales.psales_date,
      packedsales.emp_id,
      packedsales.cust_id,
      packedsales.cust_address,
      packedsales.cust_tel,
      packedsales.delivery_date,
      packedsales.delivery_time,
      packedsales.total,
      packedsales.carriage,
      packedsales.excise,
      sales.prod_id,
      sales.quantity,
      sales.price
    SQL
    )
  end

  def self.find_by_psales_no(psales_no)
    find_by(psales_no: psales_no)
  end

  def self.after_september_1994
    where('psales_date >= ?', Date.new(1994, 9))
  end

  # 税抜売上合計金額を計算
  def net_total
    total - excise
  end
end
