class PurchaseRecordProduct < ApplicationRecord
  belongs_to :product
  belongs_to :purchase_record
end
