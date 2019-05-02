class Api::V1::Customers::InvoicesController < ApplicationController
  def show
    render json: CustomerSerializer.new(Customer.find(params[:id]).invoices)
  end
end
