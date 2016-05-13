class CreateQuestionAnswerOptions < ActiveRecord::Migration
  def change
    create_table :question_answer_options do |t|
      t.references :question, index: true, foreign_key: true
      t.references :answer_option, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
