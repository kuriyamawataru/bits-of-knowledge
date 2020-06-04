class BasketsController < ApplicationController
  before_action :authenticate_user!
  def show
    basket = current_user.basket
    @products = basket.products
    @total_price = basket.total_price
  end
end
