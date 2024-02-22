class CustomersController < ApplicationController
  def index
    customers = Customer.all
    render status: 200, json: { customer: customers }
  end
end
