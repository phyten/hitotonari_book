class CreateWholeAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :whole_answers do |t|
      t.references :book, foreign_key: true
      t.integer :whole_question_id
      t.integer :period_id

      t.timestamps
    end
  end
end
