class Product < ApplicationRecord
  acts_as_taggable
  has_many :basket_products, dependent: :destroy
  has_many :purchase_product_records, dependent: :destroy


  validates :name, presence: true 
  validates :description, presence: true
  validates :explanation, presence: true
  validates :price, presence: true


end
