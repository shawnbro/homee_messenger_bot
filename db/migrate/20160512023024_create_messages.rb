class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true, foreign_key: trued
      t.json :json_data

      t.timestamps null: false
    end
  end
end
