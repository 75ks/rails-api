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
end
