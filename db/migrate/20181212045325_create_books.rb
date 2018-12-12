class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :book_photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
