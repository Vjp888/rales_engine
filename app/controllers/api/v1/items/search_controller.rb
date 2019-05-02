class Api::V1::Items::SearchController < ApplicationController
  def show
    if query_params[:unit_price]
      price = query_params[:unit_price].gsub(/[.]/,"")
      render json: ItemSerializer.new(Item.order(id: :asc).find_by(unit_price: price))
    else
      render json: ItemSerializer.new(Item.order(id: :asc).find_by(query_params))
    end
  end

  def index
    if query_params[:unit_price]
      price = query_params[:unit_price].gsub(/[.]/,"")
      render json: ItemSerializer.new(Item.where(unit_price: price).order(id: :asc))
    else
      render json: ItemSerializer.new(Item.where(query_params).order(id: :asc))
    end
  end

  private

  def query_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
