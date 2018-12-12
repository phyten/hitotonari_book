class CreateDetailedAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :detailed_answers do |t|
      t.references :whole_answer, foreign_key: true
      t.text :content
      t.integer :detailed_question_id

      t.timestamps
    end
  end
end
