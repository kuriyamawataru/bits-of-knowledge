class AddProductIdToPurchaseRecord < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchase_records, :product,index: true
  end
end
