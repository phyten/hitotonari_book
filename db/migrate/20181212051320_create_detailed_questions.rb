class CreateDetailedQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :detailed_questions do |t|
      t.references :whole_question, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
