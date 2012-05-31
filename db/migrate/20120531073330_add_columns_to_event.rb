class AddColumnsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :twitter_id,  :string
    add_column :events, :twitter_img, :string
    add_column :events, :username,    :string
  end
end
