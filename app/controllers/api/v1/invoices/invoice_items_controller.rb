class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def show
    render json: InvoiceSerializer.new(Invoice.find(params[:id]).invoice_items)
  end
end
