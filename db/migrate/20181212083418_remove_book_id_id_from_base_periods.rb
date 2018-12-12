class RemoveBookIdIdFromBasePeriods < ActiveRecord::Migration[5.0]
  def change
    remove_column :base_periods, :book_id_id, :integer
  end
end
