class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null:false
      t.integer :item_id, null: false
      t.integer :purchase_price, null: false
      t.integer :quantity, null: false
      t.integer :making_status, null:false, default: 0
      t.datetime :created_at, null: false, default: -> { 'NOW()' }
      t.datetime :updated_at, null: false, default: -> { 'NOW()' }

      t.timestamps
    end
  end
end
