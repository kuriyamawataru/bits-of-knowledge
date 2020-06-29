class ChargesController < ApplicationController
  def create
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    token = params[:stripeToken]
    product_ids = params[:product_ids].map(&:to_i)

    products = current_user.basket.products.where(id: product_ids)
    total = products.sum(:price)

    basket_products = current_user.basket.basket_products.where(product_id: product_ids)
    basket_products.each(&:destroy!)
    
    Stripe::Charge.create({
      amount: total,
      currency: 'jpy',
      description: 'Example charge',
      source: token
    })
    
    purchase_record = current_user.purchase_record || current_user.create_purchase_record
    ids = product_ids.map { |id| { product_id: id} }
    purchase_record.purchase_record_products.create!(ids)

    redirect_to products_path, notice: '決済に成功しました'
  end
end
