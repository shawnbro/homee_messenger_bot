class AddQuestionIdToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :question, index: true, foreign_key: true
  end
end
