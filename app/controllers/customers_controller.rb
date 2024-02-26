class CustomersController < ApplicationController
  def index
    customers = Customer.all
    render status: 200, json: { customer: customers }
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      render json: customer, status: :created
    else
      render json: customer.errors, status: :unprocessable_entity
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:cust_name, :address, :tel, :fax)
    end
end
