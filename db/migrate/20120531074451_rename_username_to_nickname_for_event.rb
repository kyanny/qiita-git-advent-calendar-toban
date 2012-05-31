class RenameUsernameToNicknameForEvent < ActiveRecord::Migration
  def change
    rename_column :events, :username, :nickname
  end
end
