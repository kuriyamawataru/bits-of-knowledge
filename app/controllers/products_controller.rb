class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc).limit(12)

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      flash[:error] = '作成に失敗'
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @current_user_record = PurchaseRecordProduct.where(purchase_record: current_user.id).pluck(:product_id)
  end

  def search
    @products = Product.all.order(created_at: :desc).limit(12)
    @search_products = Product.search(params[:keyword])
    
  end
 


  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :explanation, :tag_list, :thumbnail).merge(seller_id: current_user.id, nickname: current_user.nickname)
  end
end
