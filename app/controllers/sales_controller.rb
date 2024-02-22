class SalesController < ApplicationController
  def index
    sales = Sale.all
    render status: 200, json: { sales: sales }
  end
end
