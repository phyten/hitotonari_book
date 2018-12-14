class CreatePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :periods do |t|
      t.references :base_period, foreign_key: true
      t.references :whole_answer, foreign_key: true

      t.index [:base_period_id, :whole_answer_id], unique: true
      t.timestamps
    end
  end
end
