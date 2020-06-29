class Product < ApplicationRecord
  mount_uploader :thumbnail, ThumbnailUploader
  acts_as_taggable
  has_many :basket_products, dependent: :destroy
  has_many :purchase_records, dependent: :destroy


  validates :name, presence: true 
  validates :description, presence: true
  validates :explanation, presence: true
  validates :price, presence: true

  def self.search(search)
    return Product.all unless search
    Product.where('name LIKE(?)', "%#{search}%").order(created_at: :desc)
  end

end
