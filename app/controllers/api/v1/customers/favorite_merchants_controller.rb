class Api::V1::Customers::FavoriteMerchantsController < ApplicationController
  def show
    render json: MerchantSerializer.new(Customer.favorite_merchant(params[:id]))
  end
end
