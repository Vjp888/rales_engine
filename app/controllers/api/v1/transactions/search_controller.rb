class Api::V1::Transactions::SearchController < ApplicationController
  def show
    render json: TransactionSerializer.new(Transaction.find_by(query_params))
  end

  def index
    render json: TransactionSerializer.new(Transaction.where(query_params))
  end

  private

  def query_params
    params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
  end
end
