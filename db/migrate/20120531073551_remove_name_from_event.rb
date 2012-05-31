class RemoveNameFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :name
  end
end
