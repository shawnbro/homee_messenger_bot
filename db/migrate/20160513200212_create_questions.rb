class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :prompt
      t.integer :ordering

      t.timestamps null: false
    end
  end
end
