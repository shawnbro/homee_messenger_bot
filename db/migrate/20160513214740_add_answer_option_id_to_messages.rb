class AddAnswerOptionIdToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :answer_option, index: true, foreign_key: true
  end
end
