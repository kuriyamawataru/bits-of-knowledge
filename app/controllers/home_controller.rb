class HomeController < ApplicationController
  def index
    records = PurchaseRecordProduct.all.limit(6).pluck(:product_id)
    @products = Product.where id:records
  end
end