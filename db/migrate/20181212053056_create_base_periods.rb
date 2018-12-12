class CreateBasePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :base_periods do |t|
      t.string :name

      t.timestamps
    end
  end
end
