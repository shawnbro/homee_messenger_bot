class AddAttachmentsFieldToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :attachments, :json
  end
end
