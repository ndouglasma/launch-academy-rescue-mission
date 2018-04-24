class AddIndexAnswers < ActiveRecord::Migration[5.2]
  def change
    add_index :answers, [:user_id, :question_id, :detail], unique: true
  end
end
