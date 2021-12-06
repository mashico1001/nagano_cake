class RemoveUodatedAtFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :uodated_at, :datatime
  end
end
