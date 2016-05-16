class AddFbIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :fb_id, :string
  end
end
