class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.text :detail, null: false
      t.boolean :best_answer, null: false, default: false
      t.timestamps
    end
  end
end
