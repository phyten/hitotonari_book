class CreatePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :periods do |t|
      t.references :base_period, foreign_key: true

      t.timestamps
    end
  end
end
