# パックセールモデルはパックセールデータを表すActiveRecordモデルです。
class Packedsale < ApplicationRecord
  # パックセールは複数のセールを持つ関連性を定義します。
  has_many :sales, foreign_key: :psales_no
  # パックセールは従業員に所属する関連性を定義します。
  belongs_to :employee, foreign_key: :emp_id

  # セール情報を含むパックセールのクエリを返します。
  def self.with_sales
    joins("left join sales on packedsales.psales_no = sales.psales_no").select(<<-SQL
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

  # 指定されたパックセール番号に基づいてパックセールを検索します。
  #
  # @param psales_no [String] パックセール番号
  # @return [Packedsale, nil] パックセールオブジェクトまたはnil
  def self.find_by_psales_no(psales_no)
    find_by(psales_no: psales_no)
  end

  # 1994年9月以降のパックセールを返します。
  #
  # @return [ActiveRecord::Relation] パックセールのクエリオブジェクト
  def self.after_september_1994
    where('psales_date >= ?', Date.new(1994, 9))
  end

  # 純計を計算して返します。
  #
  # @return [Float] 純計
  def net_total
    total - excise
  end

  # 指定されたパックセール番号に基づいて従業員を検索します。
  #
  # @param psales_no [String] パックセール番号
  # @return [Employee, nil] 従業員オブジェクトまたはnil
  def self.employee(psales_no)
    packedsale = Packedsale.find_by(psales_no: psales_no)
    Employee.find_by(id: packedsale.emp_id)
  end
end
