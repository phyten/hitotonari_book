class RemovePeriodIdFromWholeAnswers < ActiveRecord::Migration[5.0]
  def change
    remove_column :whole_answers, :period_id, :integer
  end
end
