class CreateScoredata < ActiveRecord::Migration[6.1]
  def change
    create_table :scoredata do |t|
      t.float :annual_income
      t.string :culture
      t.integer :ha_propriety
      t.string :garantia
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
