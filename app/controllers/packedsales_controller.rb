class PackedsalesController < ApplicationController
  def index
    # packedsalesテーブルのレコードを全て取得
    # packedsales = Packedsale.all
    # packedsalesテーブルとsalesテーブルを結合させたレコードを全て取得
    packedsales = Packedsale.with_sales
    render status: 200, json: { packedsales: packedsales }
  end

  def show
    packedsale = Packedsale.find_by_psales_no(params[:id])
    if packedsale
      render json: packedsale
    else
      render json: { error: "Packedsale with psales_no=#{params[:psales_no]} not found." }, status: :not_found
    end
  end

  def after_september_1994
    Rails.logger.info "Inside after_september_1994 action"
    packedsales = Packedsale.after_september_1994
    render json: packedsales
  end

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
end
