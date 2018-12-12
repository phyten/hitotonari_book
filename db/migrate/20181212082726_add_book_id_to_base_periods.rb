class AddBookIdToBasePeriods < ActiveRecord::Migration[5.0]
  def change
    add_reference :base_periods, :book, foreign_key: true
  end
end
