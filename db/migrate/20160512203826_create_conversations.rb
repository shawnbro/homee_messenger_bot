class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :archived, default: false

      t.timestamps null: false
    end
  end
end
