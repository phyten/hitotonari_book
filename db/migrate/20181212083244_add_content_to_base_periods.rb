class AddContentToBasePeriods < ActiveRecord::Migration[5.0]
  def change
    add_column :base_periods, :content, :text
  end
end
