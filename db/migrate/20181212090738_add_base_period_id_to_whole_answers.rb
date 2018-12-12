class AddBasePeriodIdToWholeAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :whole_answers, :base_period_id, :integer
  end
end
