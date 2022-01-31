class OrderDetail < ApplicationRecord
  enum making_status: { not_startable: 0, waiting_for_production: 1, making: 2, completed: 3 }
  
  belongs_to :order
  belongs_to :item
  
end
