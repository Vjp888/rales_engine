class Api::V1::Merchants::InvoicesController < ApplicationController
  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]).invoices)
  end
end
