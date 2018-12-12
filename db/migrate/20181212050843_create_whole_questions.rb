class CreateWholeQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :whole_questions do |t|
      t.string :content
      t.boolean :required

      t.timestamps
    end
  end
end
