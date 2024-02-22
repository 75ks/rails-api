class ProductsController < ApplicationController
  def index
    products = Product.all
    render status: 200, json: { products: products }
  end
end
