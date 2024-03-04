class PackedsalesController < ApplicationController
  def index
    # packedsalesテーブルのレコードを全て取得
    # packedsales = Packedsale.all
    # packedsalesテーブルとsalesテーブルを結合させたレコードを全て取得
    packedsales = Packedsale.with_sales
    render status: 200, json: { packedsales: packedsales }
  end
end
