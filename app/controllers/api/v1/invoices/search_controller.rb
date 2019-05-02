class Api::V1::Invoices::SearchController < ApplicationController
  def show
    render json: InvoiceSerializer.new(Invoice.find_by(query_params))
  end

  def index
    render json: InvoiceSerializer.new(Invoice.where(query_params))
  end

  private

  def query_params
    params.permit(:id, :customer_id, :status, :merchant_id, :created_at, :updated_at)
  end
end
