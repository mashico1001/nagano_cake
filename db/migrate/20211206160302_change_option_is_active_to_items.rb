class ChangeOptionIsActiveToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :is_active, :boolean, null: false, default: true
  end
end
