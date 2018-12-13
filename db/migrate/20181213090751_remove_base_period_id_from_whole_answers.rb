class RemoveBasePeriodIdFromWholeAnswers < ActiveRecord::Migration[5.0]
  def change
    remove_column :whole_answers, :base_period_id, :integer
  end
end
