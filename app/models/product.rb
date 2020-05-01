class Product < ApplicationRecord
  has_many :basket_products, dependent: :destroy


  validates :name, presence: true 
  validates :description, presence: true
  validates :price, presence: true
  validates :unit, presence: true


end
