class RemoveUserIdFromMessages < ActiveRecord::Migration
  def self.up
    remove_column :messages, :user_id
  end

  def self.down
    add_column :messages, :user_id
  end
end
