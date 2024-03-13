# PackedsalesControllerはパックセールに関する操作を行うコントローラーです。
class PackedsalesController < ApplicationController
  # GET /packedsales
  # パックセールの一覧を取得します。
  def index
    packedsales = Packedsale.with_sales
    render status: 200, json: { packedsales: packedsales }
  end

  # GET /packedsales/:id
  # 指定されたIDに基づいてパックセールを取得します。
  def show
    packedsale = Packedsale.find_by_psales_no(params[:id])
    if packedsale
      render json: packedsale
    else
      render json: { error: "Packedsale with psales_no=#{params[:psales_no]} not found." }, status: :not_found
    end
  end

  # GET /packedsales/after_september_1994
  # 1994年9月以降のパックセールを取得します。
  def after_september_1994
    Rails.logger.info "Inside after_september_1994 action"
    packedsales = Packedsale.after_september_1994
    render json: packedsales
  end

  # GET /packedsales/net_totals
  # パックセールのIDと純利益の一覧を取得します。
  def net_totals
    packedsales = Packedsale.all
    net_totals = packedsales.map do |packedsale|
      {
        psales_no: packedsale.psales_no,
        net_total: packedsale.net_total
      }
    end
    render json: net_totals
  end

  # GET /packedsales/employee/:psales_no
  # 指定されたパックセールの従業員を取得します。
  def employee
    employee = Packedsale.employee(params[:psales_no])
    render json: employee
  end
end
