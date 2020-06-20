class Basket < ApplicationRecord
  has_many :basket_products, dependent: :destroy
  has_many :products, through: :basket_products

  # def total_price
  #   total_jpy_price + total_usd_price
  # end
  
  def total_price
    jp_products = products.all
    jp_products.sum(:price)
  end


end
