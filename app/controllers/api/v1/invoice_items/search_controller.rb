class Api::V1::InvoiceItems::SearchController < ApplicationController
  def show
    if query_params[:unit_price]
      price = query_params[:unit_price].gsub(/[.]/,"")
      render json: InvoiceItemSerializer.new(InvoiceItem.find_by(unit_price: price))
    else
      render json: InvoiceItemSerializer.new(InvoiceItem.find_by(query_params))
    end
  end

  def index
    if query_params[:unit_price]
      price = query_params[:unit_price].gsub(/[.]/,"")
      render json: InvoiceItemSerializer.new(InvoiceItem.where(unit_price: price))
    else
      render json: InvoiceItemSerializer.new(InvoiceItem.where(query_params))
    end
  end

  private

  def query_params
    params.permit(:id, :invoice_id, :item_id, :unit_price, :quantity, :created_at, :updated_at)
  end
end
