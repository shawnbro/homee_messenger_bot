class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :fb_id
      t.references :conversation, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.references :answer_option, index: true, foreign_key: true
      t.string :text
      t.json :attachments

      t.timestamps null: false
    end
  end
end
