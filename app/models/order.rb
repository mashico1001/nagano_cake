class Order < ApplicationRecord
  enum payment_status: { credit_card: 0, transfer: 1 }
  enum order_status: { not_payment: 0, payment_confirmation: 1, production: 2, preparing: 3, shipped: 4 } 
  
  belongs_to :customer
end
