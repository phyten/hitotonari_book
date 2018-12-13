class AddWholeAnswerToBasePeriods < ActiveRecord::Migration[5.0]
  def change
    add_reference :base_periods, :whole_answer, foreign_key: true
  end
end
